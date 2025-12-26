import 'package:bond/core/global_models/generic_model.dart';

class MyAddress {
  MyAddress({
    this.id,
    this.city,
    this.governorate,
    this.address,
    this.streetAddress,
    this.latitude,
    this.longitude,
    this.additionalNotes,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  MyAddress.fromJson(dynamic json) {
    id = json['id'];
    city = json['city'] != null ? GenericModel.fromJson(json['city']) : null;
    governorate = json['governorate'] != null
        ? GenericModel.fromJson(json['governorate'])
        : null;
    address = json['address'];
    streetAddress = json['street_address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    additionalNotes = json['additional_notes'];
    isDefault = json['is_default'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  static List<MyAddress> fromJsonList(Map<String, dynamic> response) {
    final List<dynamic> dataList = response['data'] as List<dynamic>;
    return dataList
        .map((item) => MyAddress.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  num? id;
  GenericModel? city;
  GenericModel? governorate;
  String? address;
  String? streetAddress;
  String? latitude;
  String? longitude;
  String? additionalNotes;
  bool? isDefault;
  String? createdAt;
  String? updatedAt;
}
