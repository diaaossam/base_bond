import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/category_model.dart';
import '../../../data/repositories/main_repository_impl.dart';

@Injectable()
class CategoriesCubit extends Cubit<BaseState<List<CategoryModel>>> {
  final MainRepositoryImpl mainRepositoryImpl;

  CategoriesCubit(this.mainRepositoryImpl) : super(BaseState.initial()) {
    _getCategories();
  }

  Future<void> _getCategories({int page = 1}) async {
    emit(state.copyWith(status: BaseStatus.loading));
    final response = await mainRepositoryImpl.getCategories(pageKey: page);
    response.fold(
      (failure) => emit(
        state.copyWith(status: BaseStatus.failure, error: failure.message),
      ),
      (success) =>
          emit(state.copyWith(status: BaseStatus.success, data: success)),
    );
  }
}
