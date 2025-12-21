import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/product/data/models/request/product_params.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:bond/features/product/data/repositories/product_repository_impl.dart';
import 'package:injectable/injectable.dart';

part 'product_state.dart';

@Injectable()
class ProductCubit extends Cubit<BaseState<List<ProductModel>>>
    with AsyncHandler<List<ProductModel>> {
  final ProductRepositoryImpl productRepository;

  ProductCubit(this.productRepository)
    : super(BaseState.initial(data: <ProductModel>[]));

  Future<void> getProducts(ProductParams params) async {
    await handleAsync(
      identifier: 'products',
      call: () => productRepository.getProducts(params),
      onSuccess: (products) => products,
    );
  }

  Future<List<ProductModel>> getPaginationProducts(ProductParams params) async {
    List<ProductModel> list = [];
    final response = await productRepository.getProducts(params);
    response.fold((l) => list = [], (r) => list = r);
    return list;
  }
}
