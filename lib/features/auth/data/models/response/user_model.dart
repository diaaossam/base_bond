import '../../../../location/data/models/response/my_address.dart';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.status,
    this.deviceType,
    this.defaultLang,
    this.isEmailVerified,
    this.profileImage,
    this.createdAt,
    this.updatedAt,
    this.address,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    deviceType = json['device_type'];
    defaultLang = json['default_lang'];
    isEmailVerified = json['is_email_verified'];
    profileImage = json['profile_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['default_address'] != null) {
      address = MyAddress.fromJson(json['default_address']);
    }
  }

  num? id;
  String? name;
  String? email;
  String? phone;
  String? status;
  String? deviceType;
  String? defaultLang;
  bool? isEmailVerified;
  String? profileImage;
  String? createdAt;
  String? updatedAt;
  MyAddress? address;
}
