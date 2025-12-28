import 'package:bond/core/enum/order_type.dart';
import 'package:bond/core/services/api/api_handler_mixin.dart';
import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/orders/data/datasources/order_locale_data_source.dart';
import 'package:bond/features/orders/data/datasources/order_remote_data_source.dart';
import 'package:bond/features/orders/data/models/request/cart_params.dart';
import 'package:bond/features/orders/data/models/response/coupon_model.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/features/orders/data/models/response/points_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class OrderRepositoryImpl with ApiHandlerMixin {
  final OrderRemoteDataSource orderRemoteDataSource;
  final OrderLocaleDataSource orderLocaleDataSource;

  OrderRepositoryImpl({
    required this.orderRemoteDataSource,
    required this.orderLocaleDataSource,
  });

  Future<Either<Failure, List<CartItem>>> getCartList() async {
    final response = await handleApi(() => orderLocaleDataSource.getCartList());
    return response;
  }

  Future<Either<Failure, bool>> addProductToCart({
    required List<CartItem> cartProductList,
  }) async {
    final response = await handleApi(
      () => orderLocaleDataSource.addProductToCart(
        cartProductList: cartProductList,
      ),
    );
    return response;
  }

  Future<Either<Failure, bool>> deleteProductFromCart({
    required List<CartItem> cartProductList,
    required String id,
  }) async {
    final response = await handleApi(
      () => orderLocaleDataSource.deleteProductToCart(
        cartProductList: cartProductList,
        id: id,
      ),
    );
    return response;
  }

  Future<Either<Failure, List<CartItem>>> setQuantity({
    required List<CartItem> cartProductList,
    required String productId,
    required bool isIncrease,
  }) async {
    final response = await handleApi(
      () async => orderLocaleDataSource.setQuantity(
        productId: productId,
        cartProductList: cartProductList,
        isIncrease: isIncrease,
      ),
    );
    return response;
  }

  Future<Either<Failure, Orders>> placeOrder({
    required CartParams placeOrderModel,
  }) async {
    final response = await handleApi(
      () async => await orderRemoteDataSource.placeOrder(
        placeOrderModel: placeOrderModel,
      ),
    );
    return response;
  }

  Future<Either<Failure, CouponModel>> applyPromoCode({
    required String code,
  }) async {
    final response = await handleApi(
      () => orderRemoteDataSource.applyPromoCode(code: code),
    );
    return response;
  }

  Future<Either<Failure, PointsModel>> getOrderPoints({
    required num orderPoints,
  }) async {
    final response = await handleApi(
      () => orderRemoteDataSource.getOrderPoints(orderPoints: orderPoints),
    );
    return response;
  }

  Future<Either<Failure, List<Orders>>> getOrderList({
    required int pageKey,
    required OrderType orderType,
  }) async {
    final response = await handleApi(
      () => orderRemoteDataSource.getOrderList(
        pageKey: pageKey,
        orderType: orderType,
      ),
    );
    return response;
  }

  Future<Either<Failure, Orders>> getOrderDetails({required int id}) async {
    final response = await handleApi(
      () => orderRemoteDataSource.getOrderDetails(id: id),
    );
    return response;
  }

  Future<Either<Failure, Unit>> deleteOrder({required num id}) async {
    final response = await handleApi(
      () => orderRemoteDataSource.deleteOrder(id: id),
    );
    return response;
  }

  Future<Either<Failure, Unit>> rateOrderItem({
    required int productId,
    required int orderId,
    required int rating,
    String? comment,
  }) async {
    final response = await handleApi(
      () => orderRemoteDataSource.rateOrderItem(
        productId: productId,
        orderId: orderId,
        rating: rating,
        comment: comment,
      ),
    );
    return response;
  }
}
