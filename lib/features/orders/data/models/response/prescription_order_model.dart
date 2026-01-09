import 'package:bond/features/app/data/models/branches_model.dart';
import 'package:bond/features/location/data/models/response/my_address.dart';

import '../../../../../core/enum/order_type.dart';

class PrescriptionOrderModel {
  PrescriptionOrderModel({
    this.id,
    this.orderNumber,
    this.status,
    this.deliveryWay,
    this.paymentMethod,
    this.prescriptionImage,
    this.address,
    this.pharmacyBranch,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  PrescriptionOrderModel.fromJson(dynamic json) {
    id = json['id'];
    orderNumber = json['order_number'];
    status = handleStringToOrderType(code: json['status']);
    deliveryWay = json['delivery_way'];
    paymentMethod = json['payment_method'];
    prescriptionImage = json['prescription_image'];
    address = json['address'] != null
        ? MyAddress.fromJson(json['address'])
        : null;
    pharmacyBranch = json['pharmacy_branch'] != null
        ? BranchesModel.fromJson(json['pharmacy_branch'])
        : null;
    notes = json['notes'];
    createdAt = DateTime.tryParse(json['created_at']);
    updatedAt = DateTime.tryParse(json['updated_at']);
  }

  num? id;
  String? orderNumber;
  OrderType? status;
  String? deliveryWay;
  String? paymentMethod;
  String? prescriptionImage;
  MyAddress? address;
  BranchesModel? pharmacyBranch;
  String? notes;
  DateTime? createdAt;
  DateTime? updatedAt;

  static List<PrescriptionOrderModel> fromJsonList(
    Map<String, dynamic> response,
  ) {
    final List<dynamic> dataList = response['data'] as List<dynamic>;
    return dataList
        .map(
          (item) =>
              PrescriptionOrderModel.fromJson(item as Map<String, dynamic>),
        )
        .toList();
  }
}
