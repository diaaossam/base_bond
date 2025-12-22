import 'package:bond/core/enum/order_type.dart';
import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/features/orders/data/models/request/cart_params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/response/coupon_model.dart';
import '../models/response/orders.dart';
import '../models/response/points_model.dart';

abstract class OrderRemoteDataSource {
  Future<num> placeOrder({required CartParams placeOrderModel});

  Future<CouponModel> applyPromoCode({required String code});

  Future<List<Orders>> getOrderList({
    required int pageKey,
    required OrderType orderType,
  });

  Future<Orders> getOrderDetails({required int id});

  Future<Unit> deleteOrder({required num id});

  Future<PointsModel> getOrderPoints({required num orderPoints});
}

@Injectable(as: OrderRemoteDataSource)
class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final DioConsumer dioConsumer;

  OrderRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<CouponModel> applyPromoCode({required String code}) {
    // TODO: implement applyPromoCode
    throw UnimplementedError();
  }

  @override
  Future<Unit> deleteOrder({required num id}) {
    // TODO: implement deleteOrder
    throw UnimplementedError();
  }

  @override
  Future<Orders> getOrderDetails({required int id}) {
    // TODO: implement getOrderDetails
    throw UnimplementedError();
  }

  @override
  Future<List<Orders>> getOrderList({
    required int pageKey,
    required OrderType orderType,
  }) {
    // TODO: implement getOrderList
    throw UnimplementedError();
  }

  @override
  Future<PointsModel> getOrderPoints({required num orderPoints}) {
    // TODO: implement getOrderPoints
    throw UnimplementedError();
  }

  @override
  Future<num> placeOrder({required CartParams placeOrderModel}) {
    // TODO: implement placeOrder
    throw UnimplementedError();
  }
}
