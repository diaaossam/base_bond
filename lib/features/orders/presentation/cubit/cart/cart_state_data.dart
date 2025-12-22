import 'package:bond/features/orders/data/models/request/cart_params.dart';
import 'package:bond/features/orders/data/models/response/coupon_model.dart';
import 'package:bond/features/orders/data/models/response/points_model.dart';
import 'package:equatable/equatable.dart';

class CartStateData extends Equatable {
  final List<CartItem> cartList;
  final CouponModel? couponModel;
  final PointsModel? pointsModel;
  final num? orderId;
  final String? couponCode;
  final double amount;
  final num totalCount;
  final double couponDiscount;
  final double pointDiscount;
  final bool isFreeDelivery;
  final AvailablePoints? availablePoints;

  const CartStateData({
    this.cartList = const [],
    this.couponModel,
    this.pointsModel,
    this.orderId,
    this.couponCode,
    this.amount = 0.0,
    this.totalCount = 0,
    this.couponDiscount = 0.0,
    this.pointDiscount = 0.0,
    this.isFreeDelivery = false,
    this.availablePoints,
  });

  CartStateData copyWith({
    List<CartItem>? cartList,
    CouponModel? couponModel,
    PointsModel? pointsModel,
    num? orderId,
    String? couponCode,
    double? amount,
    num? totalCount,
    double? couponDiscount,
    double? pointDiscount,
    bool? isFreeDelivery,
    AvailablePoints? availablePoints,
  }) {
    return CartStateData(
      cartList: cartList ?? this.cartList,
      couponModel: couponModel ?? this.couponModel,
      pointsModel: pointsModel ?? this.pointsModel,
      orderId: orderId ?? this.orderId,
      couponCode: couponCode ?? this.couponCode,
      amount: amount ?? this.amount,
      totalCount: totalCount ?? this.totalCount,
      couponDiscount: couponDiscount ?? this.couponDiscount,
      pointDiscount: pointDiscount ?? this.pointDiscount,
      isFreeDelivery: isFreeDelivery ?? this.isFreeDelivery,
      availablePoints: availablePoints ?? this.availablePoints,
    );
  }

  @override
  List<Object?> get props => [
        cartList,
        couponModel,
        pointsModel,
        orderId,
        couponCode,
        amount,
        totalCount,
        couponDiscount,
        pointDiscount,
        isFreeDelivery,
        availablePoints,
      ];
}
