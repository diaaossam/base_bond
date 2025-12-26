import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/product/data/repositories/product_repository_impl.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/bloc/helper/either_extensions.dart';
import '../../../../orders/data/models/request/cart_params.dart';
import '../../../data/models/response/product_model.dart';

@Injectable()
class ProductDetailsCubit extends Cubit<BaseState<CartItem>>
    with AsyncHandler<CartItem> {
  final ProductRepositoryImpl productRepositoryImpl;

  ProductDetailsCubit(this.productRepositoryImpl) : super(BaseState());

  Future<void> getProductDetails({
    required num id,
    ProductModel? productModel,
  }) async {
    if (productModel != null) {
      _initCartData(productModel: productModel);
    } else {
      await handleAsync(
        identifier: 'product_details',
        call: () => productRepositoryImpl.getProductDetails(id),
        onSuccess: (data) {
          _initCartData(productModel: data);
          return state.data ?? CartItem();
        },
      );
    }
  }

  Future<void> toggleWishlist({required num id}) async {
    emit(state.loading(identifier: 'toggle_wishlist'));
    emit(state.success(data: state.data, identifier: 'toggle_wishlist'));
  }

  void updateCartItem({required CartItem item}) {
    emit(state.success(data: item, identifier: 'update_cart_item'));
  }

  void _initCartData({required ProductModel productModel}) {
    final stock = productModel.currentStock != null
        ? (num.tryParse(productModel.currentStock!) ?? 0)
        : null;
    final price = productModel.salePrice ?? 0;

    CartItem cartItem = (state.data ?? CartItem()).copyWith(
      currentItemPrice: price,
      productModel: productModel,
      price: price,
      stock: stock,
      qty: 1,
      productId: productModel.id,
      uniqueProductId: productModel.id.toString(),

    );
    emit(state.success(data: cartItem, identifier: 'init_cart_data'));
  }
}
