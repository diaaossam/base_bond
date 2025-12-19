import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/mixin/error_handler_mixin.dart';
import 'package:injectable/injectable.dart';
import '../../data/repositories/app_repository.dart';
import 'app_state.dart';

@injectable
class AppCubit extends Cubit<AppState> with ErrorHandlerMixin<AppState> {
  final AppRepositoryImpl appRepositoryImpl;

  AppCubit(this.appRepositoryImpl) : super(const AppState()) {
    getGovernorates();
  }

  Future<void> getGovernorates() async {
    emit(state.copyWith(isLoadingGovernorates: true));
    final result = await appRepositoryImpl.getGovernorates();
    await handleResult(
      result: result,
      onSuccess: (governorates) => state.copyWith(
        governorates: governorates,
        isLoadingGovernorates: false,
      ),
      onError: (error) => state.copyWith(isLoadingGovernorates: false, errorMessage: error),
    );
  }

  Future<void> getRegion({required int id}) async {
    emit(state.copyWith(isLoadingCities: true, errorMessage: null));

    final result = await appRepositoryImpl.getRegion(id: id);

    await handleResult(
      result: result,
      onSuccess: (cities) => state.copyWith(
        cities: cities,
        isLoadingCities: false,
        errorMessage: null,
      ),
      onError: (error) => state.copyWith(isLoadingCities: false, errorMessage: error),
    );
  }
}
