import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';
import 'package:bond/features/product/data/repositories/product_repository_impl.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistCubit extends Cubit<BaseState<List<ProductModel>>>
    with AsyncHandler<List<ProductModel>> {
  final ProductRepositoryImpl productRepositoryImpl;

  WishlistCubit(this.productRepositoryImpl) : super(BaseState());

  Future<void> toggleWishList({required num productId}) async {
    handleAsync(
      call: () => productRepositoryImpl.toggleWishList(productId),
      onSuccess: (data) => state.data ?? [],
    );
  }

  Future<void> getWishList() async {
    handleAsync(
      call: () => productRepositoryImpl.getWishList(),
      onSuccess: (data) => data,
    );
  }
}
