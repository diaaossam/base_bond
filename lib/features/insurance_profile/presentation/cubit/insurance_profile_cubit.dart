import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/bloc/helper/base_state.dart';
import '../../../../core/bloc/helper/either_extensions.dart';
import '../../../../core/global_models/generic_model.dart';
import '../../data/models/insurance_profile_model.dart';
import '../../data/repositories/insurance_profile_repository.dart';
import 'insurance_profile_state_data.dart';

@Injectable()
class InsuranceProfileCubit extends Cubit<BaseState<InsuranceProfileStateData>>
    with AsyncHandler<InsuranceProfileStateData> {
  final InsuranceProfileRepository _repository;

  InsuranceProfileCubit(this._repository)
    : super(BaseState.initial(data: const InsuranceProfileStateData()));

  InsuranceProfileStateData get _data => state.data ?? const InsuranceProfileStateData();

  /// Load insurance companies list
  Future<void> loadInsuranceCompanies() async {
    await handleAsync(
      identifier: 'companies',
      call: () => _repository.getInsuranceCompanies(),
      onSuccess: (data) => _data.copyWith(insuranceCompanies: data),
    );
  }

  /// Load existing insurance profile
  Future<void> loadInsuranceProfile() async {
    await handleAsync(
      identifier: 'profile',
      call: () => _repository.getInsuranceProfile(),
      onSuccess: (data) {
        if (data != null) {
          return _data.copyWith(
            profile: data,
            selectedCompany: data.insuranceCompany,
            customCompanyName: data.customCompanyName,
            insuranceNumber: data.insuranceNumber,
          );
        }
        return _data;
      },
    );
  }

  /// Initialize - load both companies and profile
  Future<void> initialize() async {
    await loadInsuranceCompanies();
    await loadInsuranceProfile();
  }

  /// Select insurance company
  void selectCompany(GenericModel company) {
    emit(
      state.copyWith(
        data: _data.copyWith(
          selectedCompany: company,
          clearCustomCompanyName: company.id != -1,
        ),
      ),
    );
  }

  /// Update custom company name (when "Other" is selected)
  void updateCustomCompanyName(String name) {
    emit(state.copyWith(data: _data.copyWith(customCompanyName: name)));
  }

  /// Update insurance number
  void updateInsuranceNumber(String number) {
    emit(state.copyWith(data: _data.copyWith(insuranceNumber: number)));
  }

  /// Set ID card front image
  void setIdCardFront(File file) {
    emit(state.copyWith(data: _data.copyWith(idCardFront: file)));
  }

  /// Set ID card back image
  void setIdCardBack(File file) {
    emit(state.copyWith(data: _data.copyWith(idCardBack: file)));
  }

  /// Set insurance card front image
  void setInsuranceCardFront(File file) {
    emit(state.copyWith(data: _data.copyWith(insuranceCardFront: file)));
  }

  /// Set insurance card back image
  void setInsuranceCardBack(File file) {
    emit(state.copyWith(data: _data.copyWith(insuranceCardBack: file)));
  }

  /// Create insurance profile
  Future<bool> createProfile() async {
    final request = InsuranceProfileRequest(
      insuranceCompanyId: _data.selectedCompany?.id,
      customCompanyName: _data.isOtherCompanySelected
          ? _data.customCompanyName
          : null,
      insuranceNumber: _data.insuranceNumber ?? '',
      idCardFront: _data.idCardFront,
      idCardBack: _data.idCardBack,
      insuranceCardFront: _data.insuranceCardFront,
      insuranceCardBack: _data.insuranceCardBack,
    );

    final result = await handleAsync(
      identifier: 'create',
      call: () => _repository.createInsuranceProfile(request),
      onSuccess: (data) => _data.copyWith(profile: data),
    );

    return result != null;
  }

  /// Update existing insurance profile
  Future<bool> updateProfile() async {
    if (_data.profile?.id == null) return false;

    final request = InsuranceProfileRequest(
      insuranceCompanyId: _data.selectedCompany?.id,
      customCompanyName: _data.isOtherCompanySelected
          ? _data.customCompanyName
          : null,
      insuranceNumber: _data.insuranceNumber ?? '',
      idCardFront: _data.idCardFront,
      idCardBack: _data.idCardBack,
      insuranceCardFront: _data.insuranceCardFront,
      insuranceCardBack: _data.insuranceCardBack,
    );

    final result = await handleAsync(
      identifier: 'update',
      call: () =>
          _repository.updateInsuranceProfile(_data.profile!.id!, request),
      onSuccess: (data) => _data.copyWith(profile: data),
    );

    return result != null;
  }

  /// Reset form state
  void resetForm() {
    emit(
      state.copyWith(
        data: _data.copyWith(
          clearSelectedCompany: true,
          clearCustomCompanyName: true,
          insuranceNumber: '',
          clearIdCardFront: true,
          clearIdCardBack: true,
          clearInsuranceCardFront: true,
          clearInsuranceCardBack: true,
        ),
      ),
    );
  }
}
