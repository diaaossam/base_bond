import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:injectable/injectable.dart';
import '../../../data/models/category_model.dart';
import '../../../data/repositories/main_repository_impl.dart';

@Injectable()
class CategoryCubit extends Cubit<BaseState<List<CategoryModel>>> {
  final MainRepositoryImpl mainRepositoryImpl;

  CategoryCubit(this.mainRepositoryImpl) : super(BaseState.initial());

  Future<void> getCategories({int pageKey = 1}) async {
    emit(state.copyWith(status: BaseStatus.loading));
    final response = await mainRepositoryImpl.getCategories(pageKey: pageKey);
    response.fold(
      (failure) => emit(
        state.copyWith(status: BaseStatus.failure, error: failure.message),
      ),
      (success) =>
          emit(state.copyWith(status: BaseStatus.success, data: success)),
    );
  }
}
