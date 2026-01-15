import '../../../../../core/enum/deleivery_method.dart';
import '../../../../../core/enum/payment_type.dart';
import '../../../../product/data/models/response/product_model.dart';

class CartParams {
  CartParams({
    this.addressId,
    this.discountCode,
    this.items,
    this.note,
    this.pointsId,
    this.paymentType,
    this.pharmacyBranchId,
    this.deliveryMethod,
  });

  num? addressId;
  num? pointsId;
  String? discountCode;
  String? note;
  List<CartItem>? items;
  DeliveryMethod? deliveryMethod;
  PaymentType? paymentType;
  num? pharmacyBranchId;

  CartParams copyWith({
    num? pointsId,
    num? addressId,
    String? discountCode,
    List<CartItem>? items,
    String? note,
    DeliveryMethod? deliveryMethod,
    PaymentType? paymentType,
    num? pharmacyBranchId,
  }) => CartParams(
    addressId: addressId ?? this.addressId,
    discountCode: discountCode ?? this.discountCode,
    items: items ?? this.items,
    pointsId: pointsId ?? this.pointsId,
    note: note ?? this.note,
    pharmacyBranchId: pharmacyBranchId ?? this.pharmacyBranchId,
    paymentType: paymentType ?? this.paymentType,
    deliveryMethod: deliveryMethod ?? this.deliveryMethod,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address_id'] = addressId;
    map['coupon_code'] = discountCode;
    map['note'] = note;
    map['delivery_way'] = deliveryMethod?.name;
    map['payment_method'] = paymentType?.name;
    map['pharmacy_branch_id'] = pharmacyBranchId;
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
  });

  CartItem.fromJson(dynamic json) {
    productId = json['product_id'];
    qty = json['quantity'];
    stock = json['stock'];
    price = json['price'];
    currentItemPrice = json['currentItemPrice'];
    productModel = json['product'] != null
        ? ProductModel.fromJson(json: json['product'], isRemote: false)
        : null;
  }

  num? productId;
  num? qty;
  num? price;
  num? stock;
  num? currentItemPrice;
  ProductModel? productModel;

  CartItem copyWith({
    num? productId,
    num? qty,
    num? price,
    num? stock,
    num? currentItemPrice,
    ProductModel? productModel,
  }) => CartItem(
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
    map['quantity'] = qty;
    map['stock'] = stock;
    map['price'] = price;
    map['currentItemPrice'] = currentItemPrice;
    map['product'] = productModel?.toJson();
    return map;
  }
}
