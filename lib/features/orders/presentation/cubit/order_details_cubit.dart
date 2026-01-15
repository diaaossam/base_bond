import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/orders/data/repositories/order_repository_impl.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderDetailsCubit extends Cubit<BaseState<String>>
    with AsyncHandler<String> {
  final OrderRepositoryImpl _orderRepository;

  // Track rated products for this order
  final Set<int> _ratedProductIds = {};

  OrderDetailsCubit(this._orderRepository) : super(BaseState());

  bool isProductRated(int productId) => _ratedProductIds.contains(productId);

  Future<void> cancelOrder({required num id}) async {
    handleAsync(
      call: () => _orderRepository.deleteOrder(id: id),
      onSuccess: (data) => data,
    );
  }

  Future<void> rateProduct({
    required int productId,
    required int orderId,
    required int rating,
    String? comment,
  }) async {
    await handleAsync(
      identifier: 'rate_product_$productId',
      call: () => _orderRepository.rateOrderItem(
        productId: productId,
        orderId: orderId,
        rating: rating,
        comment: comment,
      ),
      onSuccess: (data) {
        _ratedProductIds.add(productId);
        return 'success';
      },
    );
  }
}
