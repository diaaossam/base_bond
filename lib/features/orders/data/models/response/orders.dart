import 'package:bond/core/enum/order_type.dart';
import 'package:bond/features/location/data/models/response/my_address.dart';
import 'package:bond/features/product/data/models/response/product_model.dart';

class Orders {
  Orders({
    this.id,
    this.orderNumber,
    this.status,
    this.address,
    this.addressData,
    this.couponCode,
    this.subtotal,
    this.discountAmount,
    this.total,
    this.notes,
    this.items,
    this.createdAt,
    this.updatedAt,
  });

  Orders.fromJson(dynamic json) {
    id = json['id'];
    orderNumber = json['order_number'];
    status = handleStringToOrderType(code: json['status']);
    address = json['address'];
    addressData = json['address_data'] != null
        ? MyAddress.fromJson(json['address_data'])
        : null;
    couponCode = json['coupon_code'];
    subtotal = json['subtotal'];
    discountAmount = json['discount_amount'];
    total = json['total'];
    notes = json['notes'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }

  num? id;
  String? orderNumber;
  OrderType? status;
  String? address;
  MyAddress? addressData;
  String? couponCode;
  num? subtotal;
  num? discountAmount;
  num? total;
  String? notes;
  List<Items>? items;
  DateTime? createdAt;
  DateTime? updatedAt;

  static List<Orders> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response['data'] as List<dynamic>;
    return dataList
        .map((item) => Orders.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}

class Items {
  Items({
    this.id,
    this.product,
    this.quantity,
    this.unitPrice,
    this.totalPrice,
  });

  Items.fromJson(dynamic json) {
    id = json['id'];
    product = json['product'] != null
        ? ProductModel.fromJson(json: json['product'], isRemote: true)
        : null;
    quantity = json['quantity'];
    unitPrice = json['unit_price'];
    totalPrice = json['total_price'];
  }

  num? id;
  ProductModel? product;
  num? quantity;
  num? unitPrice;
  num? totalPrice;
}
