import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/product/data/repositories/product_repository_impl.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/bloc/helper/either_extensions.dart';
import '../../../../main/data/models/category_model.dart';

@Injectable()
class CategoryCubit extends Cubit<BaseState<List<CategoryModel>>>
    with AsyncHandler<List<CategoryModel>> {
  final ProductRepositoryImpl productRepository;

  CategoryCubit(this.productRepository) : super(BaseState.initial());

  Future<void> getCategories() async {
    await handleAsync(
      identifier: 'category',
      call: () => productRepository.getCategories(),
      onSuccess: (data) => data,
    );
  }
}
