class UserModel {
  UserModel({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.status, 
      this.deviceType, 
      this.defaultLang, 
      this.isPhoneVerified, 
      this.profileImage, 
      this.createdAt, 
      this.updatedAt,});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    deviceType = json['device_type'];
    defaultLang = json['default_lang'];
    isPhoneVerified = json['is_phone_verified'];
    profileImage = json['profile_image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  num? id;
  String? name;
  String? email;
  String? phone;
  String? status;
  String? deviceType;
  String? defaultLang;
  bool? isPhoneVerified;
  String? profileImage;
  String? createdAt;
  String? updatedAt;
UserModel copyWith({  num? id,
  String? name,
  String? email,
  String? phone,
  String? status,
  String? deviceType,
  String? defaultLang,
  bool? isPhoneVerified,
  String? profileImage,
  String? createdAt,
  String? updatedAt,
}) => UserModel(  id: id ?? this.id,
  name: name ?? this.name,
  email: email ?? this.email,
  phone: phone ?? this.phone,
  status: status ?? this.status,
  deviceType: deviceType ?? this.deviceType,
  defaultLang: defaultLang ?? this.defaultLang,
  isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
  profileImage: profileImage ?? this.profileImage,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['status'] = status;
    map['device_type'] = deviceType;
    map['default_lang'] = defaultLang;
    map['is_phone_verified'] = isPhoneVerified;
    map['profile_image'] = profileImage;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}