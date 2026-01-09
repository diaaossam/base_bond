import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/enum/order_type.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';
import 'package:bond/features/orders/data/models/response/prescription_order_model.dart';
import 'package:bond/features/orders/data/repositories/order_repository_impl.dart';
import 'package:injectable/injectable.dart';

@injectable
class PrescriptionOrdersCubit
    extends Cubit<BaseState<List<PrescriptionOrderModel>>> {
  final OrderRepositoryImpl _orderRepository;

  PrescriptionOrdersCubit(this._orderRepository) : super(BaseState());

  Future<List<PrescriptionOrderModel>> getOrderList({
    required int pageKey,
    required OrderType orderType,
    required String type,
  }) async {
    print("--------=-=${type}");
    final result = await _orderRepository.getPrescription(
      type: type,
      pageKey: pageKey,
      orderType: orderType,
    );
    return result.fold((failure) => [], (orders) => orders);
  }
}
