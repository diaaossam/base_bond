import '../../../../product/data/models/response/product_model.dart';

class CartParams {
  CartParams({
    this.addressId,
    this.discountCode,
    this.items,
    this.note,
    this.pointsId,
  });

  num? addressId;
  num? pointsId;
  String? discountCode;
  String? note;
  List<CartItem>? items;

  CartParams copyWith({
    num? pointsId,
    num? addressId,
    String? discountCode,
    List<CartItem>? items,
    String? note,
  }) => CartParams(
    addressId: addressId ?? this.addressId,
    discountCode: discountCode ?? this.discountCode,
    items: items ?? this.items,
    pointsId: pointsId ?? this.pointsId,
    note: note ?? this.note,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address_id'] = addressId;
    map['point_id'] = pointsId;
    map['discount_code'] = discountCode;
    map['note'] = note;
    if (items != null) {
      map['items'] = items?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class CartItem {
  CartItem({
    this.productId,
    this.qty,
    this.price,
    this.productModel,
    this.stock,
    this.currentItemPrice,
    this.uniqueProductId,
  });

  CartItem.fromJson(dynamic json) {
    uniqueProductId = json['uniqueProductId'];
    productId = json['product_id'];
    qty = json['qty'];
    stock = json['stock'];
    price = json['price'];
    currentItemPrice = json['currentItemPrice'];
    productModel = json['product'] != null
        ? ProductModel.fromJson(json: json['product'], isRemote: false)
        : null;
  }

  String? uniqueProductId;
  num? productId;
  num? qty;
  num? price;
  num? stock;
  num? currentItemPrice;
  ProductModel? productModel;

  CartItem copyWith({
    num? productId,
    num? sizeId,
    num? colorId,
    num? qty,
    num? price,
    num? stock,
    num? currentItemPrice,
    ProductModel? productModel,
    String? uniqueProductId,
    String? colorSku,
    String? sizeSku,
  }) => CartItem(
    uniqueProductId: uniqueProductId ?? this.uniqueProductId,
    productId: productId ?? this.productId,
    qty: qty ?? this.qty,
    price: price ?? this.price,
    stock: stock ?? this.stock,
    productModel: productModel ?? this.productModel,
    currentItemPrice: currentItemPrice ?? this.currentItemPrice,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['qty'] = qty;
    map['stock'] = stock;
    map['price'] = price;
    map['uniqueProductId'] = uniqueProductId;
    map['currentItemPrice'] = currentItemPrice;
    map['product'] = productModel?.toJson();
    return map;
  }
}
