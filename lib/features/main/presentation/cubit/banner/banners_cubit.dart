import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/banners_model.dart';
import '../../../data/repositories/main_repository_impl.dart';

@Injectable()
class BannersCubit extends Cubit<BaseState<List<BannersModel>>> {
  final MainRepositoryImpl mainRepositoryImpl;

  BannersCubit(this.mainRepositoryImpl) : super(BaseState.initial()) {
    getBanners();
  }

  Future<void> getBanners() async {
    emit(state.copyWith(status: BaseStatus.loading));
    final response = await mainRepositoryImpl.getAllBanners();
    response.fold(
      (failure) => emit(
        state.copyWith(status: BaseStatus.failure, error: failure.message),
      ),
      (success) =>
          emit(state.copyWith(status: BaseStatus.success, data: success)),
    );
  }
}
