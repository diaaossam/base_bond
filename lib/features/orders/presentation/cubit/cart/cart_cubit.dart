import 'dart:async';
import 'dart:convert';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/core/bloc/helper/either_extensions.dart';
import 'package:bond/features/orders/data/models/request/cart_params.dart';
import 'package:bond/features/orders/data/models/response/coupon_model.dart';
import 'package:bond/features/orders/data/models/response/points_model.dart';
import 'package:bond/features/orders/data/repositories/order_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cart_state_data.dart';

@Injectable()
class CartCubit extends Cubit<BaseState<CartStateData>>
    with AsyncHandler<CartStateData> {
  final OrderRepositoryImpl orderRepository;
  final SharedPreferences sharedPreferences;

  TextEditingController discount = TextEditingController();

  CartCubit(this.orderRepository, this.sharedPreferences)
    : super(BaseState.initial(data: const CartStateData()));

  /* ======================== Cart ======================== */

  Future<void> getCartData() async {
    await handleAsync<List<CartItem>>(
      identifier: 'cart',
      call: () => orderRepository.getCartList(),
      onSuccess: (list) {
        final totals = _calculateTotals(list);
        return state.data!.copyWith(
          cartList: list,
          amount: totals.amount,
          totalCount: totals.totalCount,
        );
      },
    );

    initCoupon();
  }

  Future<void> addToCart(CartItem cartModel) async {
    final list = List<CartItem>.from(state.data!.cartList);

    final index = list.indexWhere((e) => e.productId == cartModel.productId);

    if (index != -1) {
      list[index] = list[index].copyWith(qty: (list[index].qty ?? 1) + 1);
    } else {
      list.add(cartModel);
    }

    final totals = _calculateTotals(list);

    emit(
      state.success(
        data: state.data!.copyWith(
          cartList: list,
          amount: totals.amount,
          totalCount: totals.totalCount,
          couponCode: null,
          couponDiscount: 0,
        ),
      ),
    );

    await handleAsync(
      call: () => orderRepository.addProductToCart(cartProductList: list),
      onSuccess: (_) => state.data!,
    );
  }

  Future<void> deleteItemFromCart({required String id}) async {
    final list = List<CartItem>.from(state.data!.cartList)
      ..removeWhere((e) => e.productId.toString() == id);

    final totals = _calculateTotals(list);

    emit(
      state.success(
        data: state.data!.copyWith(
          cartList: list,
          amount: totals.amount,
          totalCount: totals.totalCount,
          couponCode: null,
          couponDiscount: 0,
        ),
      ),
    );

    await handleAsync(
      call: () =>
          orderRepository.deleteProductFromCart(cartProductList: list, id: id),
      onSuccess: (_) => state.data!,
    );
  }

  Future<void> setQuantity({
    required String productId,
    required bool isIncrease,
  }) async {
    await handleAsync<List<CartItem>>(
      call: () => orderRepository.setQuantity(
        productId: productId,
        cartProductList: state.data!.cartList,
        isIncrease: isIncrease,
      ),
      onSuccess: (list) {
        final totals = _calculateTotals(list);
        return state.data!.copyWith(
          cartList: list,
          amount: totals.amount,
          totalCount: totals.totalCount,
          couponCode: null,
          couponDiscount: 0,
        );
      },
    );
  }

  /* ======================== Coupon ======================== */

  void initCoupon() {
    final jsonString = sharedPreferences.getString("coupon");
    if (jsonString == null) return;

    final model = CouponModel.fromJson(json.decode(jsonString));

    double discountValue = 0;

    if (model.isValid == true) {
      if (model.coupon?.type == "percentage") {
        discountValue = state.data!.amount * ((model.coupon?.value ?? 0) / 100);
      } else {
        discountValue = model.coupon?.value?.toDouble() ?? 0;
      }
    }

    discount.text = model.couponCode ?? "";

    emit(
      state.success(
        data: state.data!.copyWith(
          couponModel: model,
          couponCode: model.couponCode,
          couponDiscount: discountValue,
        ),
      ),
    );
  }

  Future<void> applyCoupon({required String code}) async {
    await handleAsync<CouponModel>(
      identifier: 'coupon',
      call: () => orderRepository.applyPromoCode(code: code),
      onSuccess: (coupon) {
        double discountValue = 0;

        if (coupon.isValid == true) {
          if (coupon.coupon?.type == "percentage") {
            discountValue =
                state.data!.amount * ((coupon.coupon?.value ?? 0) / 100);
          } else {
            discountValue = coupon.coupon?.value?.toDouble() ?? 0;
          }

          sharedPreferences.setString(
            "coupon",
            json.encode(coupon.copyWith(couponCode: code).toJson()),
          );
        }

        return state.data!.copyWith(
          couponModel: coupon,
          couponCode: code,
          couponDiscount: discountValue,
        );
      },
    );
  }

  void deleteCoupon() {
    sharedPreferences.remove("coupon");

    emit(
      state.success(
        data: state.data!.copyWith(
          couponModel: null,
          couponCode: null,
          couponDiscount: 0,
        ),
      ),
    );
  }

  /* ======================== Points ======================== */

  Future<void> getOrderPoints({required num price}) async {
    await handleAsync<PointsModel>(
      identifier: 'points',
      call: () => orderRepository.getOrderPoints(orderPoints: price),
      onSuccess: (points) {
        return state.data!.copyWith(pointsModel: points);
      },
    );
  }

  void applyPoints({
    required AvailablePoints applies,
    required num deleiveryAmount,
  }) {
    emit(
      state.success(
        data: state.data!.copyWith(
          availablePoints: applies,
          pointDiscount: applies.discount?.toDouble() ?? 0,
        ),
      ),
    );
  }

  /* ======================== Order ======================== */

  Future<void> placeOrder({required CartParams cart}) async {
    await handleAsync<num>(
      identifier: 'placeOrder',
      call: () => orderRepository.placeOrder(placeOrderModel: cart),
      onSuccess: (orderId) {
        sharedPreferences.remove("coupon");
        return state.data!.copyWith(orderId: orderId);
      },
    );
  }

  void clearCartOptimistically() {
    emit(state.success(data: const CartStateData()));
  }

  void refreshOnAddressChange() {
    getCartData();
  }

  /* ======================== Getters ======================== */

  List<CartItem> get cartList => state.data?.cartList ?? [];

  double get amount => state.data?.amount ?? 0.0;

  String? get couponCode => state.data?.couponCode;

  double get couponDiscount => state.data?.couponDiscount ?? 0.0;

  double get pointDiscount => state.data?.pointDiscount ?? 0.0;

  bool get isFreeDeleivery => state.data?.isFreeDelivery ?? false;

  AvailablePoints? get availablePoints => state.data?.availablePoints;

  static const double freeDeliveryThreshold = 50000.0;

  /* ======================== Helpers ======================== */

  ({double amount, num totalCount}) _calculateTotals(List<CartItem> list) {
    double amount = 0;
    num totalCount = 0;

    for (final item in list) {
      amount += (item.currentItemPrice ?? 0) * (item.qty ?? 1);
      totalCount += item.qty ?? 1;
    }

    return (amount: amount, totalCount: totalCount);
  }
}
