import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/orders/data/repositories/order_repository_impl.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrderDetailsCubit extends Cubit<BaseState<String>>
    with AsyncHandler<String> {
  final OrderRepositoryImpl _orderRepository;

  OrderDetailsCubit(this._orderRepository) : super(BaseState());

  Future<void> cancelOrder({required num id}) async {
    handleAsync(
      call: () => _orderRepository.deleteOrder(id: id),
      onSuccess: (data) => data,
    );
  }
}
