
import '../../../../../core/enum/order_type.dart';
import '../../../../product/data/models/response/product_model.dart';

class Orders {
  Orders({
    this.id,
    this.orderNumber,
    this.totalPrice,
    this.totalQty,
    this.discountAmount,
    this.discountCode,
    this.shippingCost,
    this.finalPrice,
    //this.address,
    this.status,
    this.hasPendingCancelRequest,
    this.cancelRequestStatus,
    this.items,
    this.logs,
    this.isOrderRated,
    this.createdAt,
    this.discountAmountFromPoints,
  });

  Orders.fromJson(dynamic json) {
/*    id = json['id'];
    orderNumber = json['order_number'];
    totalPrice = json['total_price'];
    totalQty = json['total_qty'];
    discountAmount = json['discount_amount'];
    discountCode = json['discount_code'];
    shippingCost = json['shipping_cost'];
    finalPrice = json['final_price'];
    discountAmountFromPoints = json['discount_amount_from_points'];
    address =
        json['address'] != null ? MyAddress.fromJson(json['address']) : null;
    status = json['status'] != null
        ? handleOrderTypeToOrderType(code: json['status'])
        : null;
    hasPendingCancelRequest = json['has_pending_cancel_request'];
    cancelRequestStatus = json['cancel_request_status'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    if (json['logs'] != null) {
      logs = [];
      json['logs'].forEach((v) {
        logs?.add(Logs.fromJson(v));
      });
    }
    isOrderRated = json['is_order_rated'];
    createdAt = json['created_at'] != null
        ? DateTime.parse(json['created_at'])
        : DateTime.now();
    image = getAppImage(status);*/
  }

  num? id;
  String? orderNumber;
  num? totalPrice;
  num? totalQty;
  num? discountAmount;
  String? discountCode;
  String? image;
  num? shippingCost;
  num? finalPrice;
  //MyAddress? address;
  OrderType? status;
  num? hasPendingCancelRequest;
  num? discountAmountFromPoints;
  dynamic cancelRequestStatus;
  List<Items>? items;
  List<Logs>? logs;
  bool? isOrderRated;
  DateTime? createdAt;

}

class Logs {
  Logs({
    this.status,
    this.note,
    this.createdAt,
  });

  Logs.fromJson(dynamic json) {
    status = json['status'];
    note = json['note'];
    createdAt = json['created_at'];
  }

  String? status;
  dynamic note;
  String? createdAt;

  Logs copyWith({
    String? status,
    dynamic note,
    String? createdAt,
  }) =>
      Logs(
        status: status ?? this.status,
        note: note ?? this.note,
        createdAt: createdAt ?? this.createdAt,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['note'] = note;
    map['created_at'] = createdAt;
    return map;
  }
}

class Items {
  Items({
    this.product,
    this.qty,
    this.price,
    this.totalPrice,
  });

  Items.fromJson(dynamic json) {
    product =
        json['product'] != null ? ProductModel.fromJson(json: json['product'],isRemote: true) : null;
    qty = json['qty'];
    price = json['price'];
    totalPrice = json['total_price'];

  }

  ProductModel? product;
  num? qty;
  num? price;
  num? totalPrice;
}
