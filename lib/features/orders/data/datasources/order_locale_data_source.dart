import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/request/cart_params.dart';

abstract class OrderLocaleDataSource {
  Future<bool> addProductToCart({required List<CartItem> cartProductList});

  Future<bool> deleteProductToCart({
    required List<CartItem> cartProductList,
    required String id,
  });

  Future<List<CartItem>> getCartList();

  List<CartItem> setQuantity({
    required List<CartItem> cartProductList,
    required String productId,
    required bool isIncrease,
  });

  Future<Unit> clearCartUseCase();
}

@Injectable(as: OrderLocaleDataSource)
class OrderLocaleDataSourceImpl implements OrderLocaleDataSource {
  final SharedPreferences sharedPreferences;
  final String _cart = "cartList";

  OrderLocaleDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> clearCartUseCase() async {
    if (sharedPreferences.containsKey(_cart)) {
      await sharedPreferences.remove(_cart);
    }
    return unit;
  }

  @override
  Future<bool> addProductToCart({
    required List<CartItem> cartProductList,
  }) async {
    List<String> carts = [];
    for (var cartModel in cartProductList) {
      final json = jsonEncode(cartModel.toJson());
      carts.add(json);
    }
    sharedPreferences.setStringList(_cart, carts);
    return true;
  }

  @override
  Future<List<CartItem>> getCartList() async {
    List<String>? carts = [];
    if (sharedPreferences.containsKey(_cart)) {
      carts = sharedPreferences.getStringList(_cart);
    }
    List<CartItem> cartList = [];
    List<int> productIds = [];
    for (var cart in carts!) {
      final data = CartItem.fromJson(jsonDecode(cart));
      cartList.add(data);
      productIds.add(data.productId!.toInt());
    }
    return cartList;
  }

  @override
  Future<bool> deleteProductToCart({
    required List<CartItem> cartProductList,
    required String id,
  }) async {
    cartProductList.removeWhere(
      (cartItem) => cartItem.productId.toString() == id,
    );
    List<String> carts = [];
    for (var cartModel in cartProductList) {
      carts.add(jsonEncode(cartModel));
    }
    sharedPreferences.setStringList(_cart, carts);
    return true;
  }

  @override
  List<CartItem> setQuantity({
    required List<CartItem> cartProductList,
    required String productId,
    required bool isIncrease,
  }) {
    final cartItemIndex = cartProductList.indexWhere(
      (cartItem) => cartItem.productId.toString() == productId,
    );
    if (cartItemIndex != -1) {
      CartItem? cartItem = cartProductList[cartItemIndex];
      num qty = isIncrease ? (cartItem.qty! + 1) : (cartItem.qty! - 1);
      num price = qty * (cartItem.currentItemPrice ?? 1);
      cartItem = cartItem.copyWith(qty: qty, price: price);
      if (cartItem.qty == 0) {
        cartProductList.removeWhere(
          (element) => element.productId.toString() == productId,
        );
      } else {
        cartProductList.removeWhere(
          (element) => element.productId.toString() == productId,
        );
        cartProductList.insert(cartItemIndex, cartItem);
      }
      List<String> carts = [];
      for (var cartModel in cartProductList) {
        carts.add(jsonEncode(cartModel.toJson()));
      }
      sharedPreferences.setStringList(_cart, carts);
    }

    return cartProductList;
  }
}
