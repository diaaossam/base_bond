import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/helper/base_state.dart';
import '../../../../core/bloc/helper/either_extensions.dart';
import '../../data/repositories/app_repository.dart';
import 'app_state_data.dart';

@injectable
class AppCubit extends Cubit<BaseState<AppStateData>>
    with AsyncHandler<AppStateData> {
  final AppRepositoryImpl appRepositoryImpl;

  AppCubit(this.appRepositoryImpl)
    : super(BaseState(status: BaseStatus.initial, data: const AppStateData())) {
    getGovernorates();
  }

  Future<void> getGovernorates() async {
    await handleAsync(
      identifier: 'governorate',
      call: appRepositoryImpl.getGovernorates,
      onSuccess: (governorates) => (state.data ?? const AppStateData()).copyWith(governorates: governorates),
    );
  }

  Future<void> getRegion({required int id}) async {
    await handleAsync(
      identifier: 'cities',
      call: () => appRepositoryImpl.getRegion(id: id),
      onSuccess: (cities) =>
          (state.data ?? const AppStateData()).copyWith(cities: cities),
    );
  }
}
