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
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'city': city?.toMap(),
      'governorate': governorate?.toMap(),
      'address': address,
      'street_address': streetAddress,
      'latitude': latitude,
      'longitude': longitude,
      'additional_notes': additionalNotes,
      'is_default': isDefault,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
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
