import 'package:bloc/bloc.dart';
import 'package:bond/core/global_models/generic_model.dart';
import 'package:bond/features/insurance_profile/data/models/insurance_profile_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/bloc/helper/base_state.dart';
import '../../../../core/bloc/helper/either_extensions.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/insurance_profile_params.dart';
import '../../data/repositories/insurance_profile_repository.dart';
import 'insurance_profile_state_data.dart';

@Injectable()
class InsuranceProfileCubit extends Cubit<BaseState<InsuranceProfileStateData>>
    with AsyncHandler<InsuranceProfileStateData> {
  final InsuranceProfileRepository _repository;

  InsuranceProfileCubit(this._repository)
    : super(BaseState.initial(data: const InsuranceProfileStateData()));

  InsuranceProfileStateData get _data =>
      state.data ?? const InsuranceProfileStateData();

  Future<void> loadInsuranceCompanies() async {
    await handleAsync(
      identifier: 'companies',
      call: () => _repository.getInsuranceCompanies(),
      onSuccess: (data) {
        data.add(GenericModel(id: -1, title: S.current.otherCompany));
        return _data.copyWith(insuranceCompanies: data);
      },
    );
  }


  void selectCompany({required GenericModel model}){
    emit(state.copyWith(data: _data.copyWith(selectedCompany: model)));
  }
  Future<void> loadInsuranceProfile({InsuranceProfileModel? model}) async {
    if (model != null) {
      emit(state.copyWith(status: BaseStatus.success,data: _data.copyWith(
        profile: model,
        selectedCompany: model.insuranceCompany,
        customCompanyName: model.insuranceCompany?.title,
        insuranceNumber: model.notes,
      )));
    } else {
      await handleAsync(
        identifier: 'profile',
        call: () => _repository.getInsuranceProfile(),
        onSuccess: (data) {
          if (data != null) {
            return _data.copyWith(
              profile: data,
              selectedCompany: data.insuranceCompany,
              customCompanyName: data.insuranceCompany?.title,
              insuranceNumber: data.notes,
            );
          }
          return _data;
        },
      );
    }
  }

  /// Initialize - load both companies and profile
  Future<void> initialize() async {
    await loadInsuranceCompanies();
    await loadInsuranceProfile();
  }

  /// Create insurance profile
  Future<bool> createProfile({required InsuranceProfileRequest params}) async {
    final result = await handleAsync(
      identifier: 'create',
      call: () => _repository.createInsuranceProfile(params: params),
      onSuccess: (data) => _data.copyWith(profile: data),
    );

    return result != null;
  }

  /// Update existing insurance profile
  Future<bool> updateProfile({
    required num id,
    required InsuranceProfileRequest params,
  }) async {
    final result = await handleAsync(
      identifier: 'update',
      call: () => _repository.updateInsuranceProfile(params: params, id: id),
      onSuccess: (data) => _data.copyWith(profile: data),
    );

    return result != null;
  }
}
