import 'package:bond/core/enum/order_type.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/features/orders/data/repositories/order_repository_impl.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersCubit {
  final OrderRepositoryImpl _orderRepository;

  OrdersCubit(this._orderRepository);

  Future<List<Orders>> getOrderList({
    required int pageKey,
    required OrderType orderType,
  }) async {
    final result = await _orderRepository.getOrderList(
      pageKey: pageKey,
      orderType: orderType,
    );
    return result.fold(
      (failure) => throw failure,
      (orders) => orders,
    );
  }

  Future<void> rateOrderItem({
    required int productId,
    required int orderId,
    required int rating,
    String? comment,
  }) async {
    final result = await _orderRepository.rateOrderItem(
      productId: productId,
      orderId: orderId,
      rating: rating,
      comment: comment,
    );
    return result.fold(
      (failure) => throw failure,
      (_) => null,
    );
  }
}
