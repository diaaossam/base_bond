import 'package:bond/core/enum/order_type.dart';
import 'package:bond/core/services/api/dio_consumer.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/orders/data/models/request/cart_params.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../models/request/prescription_params.dart';
import '../models/response/coupon_model.dart';
import '../models/response/orders.dart';
import '../models/response/points_model.dart';
import '../models/response/prescription_order_model.dart';

abstract class OrderRemoteDataSource {
  Future<Orders> placeOrder({required CartParams placeOrderModel});

  Future<CouponModel> applyPromoCode({
    required String code,
    required num amount,
  });

  Future<List<Orders>> getOrderList({
    required int pageKey,
    required OrderType orderType,
  });

  Future<List<PrescriptionOrderModel>> getPrescriptionList({
    required int pageKey,
    required OrderType orderType,
    required String type,
  });

  Future<Orders> getOrderDetails({required int id});

  Future<String> deleteOrder({required num id});

  Future<PointsModel> getOrderPoints({required num orderPoints});

  Future<String> rateOrderItem({
    required int productId,
    required int orderId,
    required int rating,
    String? comment,
  });

  Future<Unit> submitPrescription({required PrescriptionParams params});
}

@Injectable(as: OrderRemoteDataSource)
class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final DioConsumer dioConsumer;

  OrderRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<CouponModel> applyPromoCode({
    required String code,
    required num amount,
  }) async {
    return await dioConsumer
        .post(EndPoints.validateCoupon)
        .body({"code": code, "order_amount": amount})
        .factory((json) => CouponModel.fromJson(json['data']))
        .execute();
  }

  @override
  Future<String> deleteOrder({required num id}) async {
    return await dioConsumer
        .post("${EndPoints.orders}/$id/cancel")
        .factory((json) => json['message'])
        .execute();
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
  }) async {
    return await dioConsumer
        .get(EndPoints.orders)
        .params({"page": pageKey, "status": orderType.name})
        .factory(Orders.fromJsonList)
        .execute();
  }

  @override
  Future<PointsModel> getOrderPoints({required num orderPoints}) {
    // TODO: implement getOrderPoints
    throw UnimplementedError();
  }

  @override
  Future<Orders> placeOrder({required CartParams placeOrderModel}) async {
    return await dioConsumer
        .post(EndPoints.orders)
        .body(placeOrderModel.toJson())
        .factory((json) => Orders.fromJson(json['data']))
        .execute();
  }

  @override
  Future<String> rateOrderItem({
    required int productId,
    required int orderId,
    required int rating,
    String? comment,
  }) async {
    return await dioConsumer
        .post(EndPoints.reviews)
        .body({
          'product_id': productId,
          'order_id': orderId,
          'rating': rating,
          if (comment != null) 'comment': comment,
        })
        .factory((json) => json['message'])
        .execute();
  }

  @override
  Future<Unit> submitPrescription({required PrescriptionParams params}) async {
    return await dioConsumer
        .post(
          params.isInsurance == true
              ? EndPoints.insuranceOrder
              : EndPoints.prescriptionOrders,
        )
        .body(params.toFormData())
        .factory((json) => unit)
        .execute();
  }

  @override
  Future<List<PrescriptionOrderModel>> getPrescriptionList({
    required int pageKey,
    required OrderType orderType,
    required String type,
  }) async {
    return await dioConsumer
        .get(
          type == AppStrings.prescription
              ? EndPoints.prescriptionOrders
              : EndPoints.insuranceOrder,
        )
        .params({"page": pageKey, "status": orderType.name})
        .factory(PrescriptionOrderModel.fromJsonList)
        .execute();
  }
}
