import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/orders/data/models/response/orders.dart';

class OrdersCubit extends Cubit<BaseState<List<Orders>>> {
  OrdersCubit() : super(BaseState());
}
