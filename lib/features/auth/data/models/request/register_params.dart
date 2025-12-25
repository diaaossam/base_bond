import 'package:dio/dio.dart';

class RegisterParams {
  RegisterParams({
    this.name,
    this.email,
    this.phone,
    this.governorateId,
    this.cityId,
    this.address,
    this.latitude,
    this.longitude,
    this.password,
    this.passwordConfirmation,
    this.deviceToken,
    this.deviceType,
    this.image,
  });

  String? name;
  String? email;
  String? phone;
  num? governorateId;
  num? cityId;
  String? address;
  String? latitude;
  String? longitude;
  String? password;
  String? passwordConfirmation;
  String? deviceToken;
  String? deviceType;
  String? image;

  RegisterParams copyWith({
    String? name,
    String? email,
    String? phone,
    num? governorateId,
    num? cityId,
    String? address,
    String? latitude,
    String? longitude,
    String? password,
    String? passwordConfirmation,
    String? deviceToken,
    String? deviceType,
    String? image,
  }) => RegisterParams(
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    governorateId: governorateId ?? this.governorateId,
    cityId: cityId ?? this.cityId,
    address: address ?? this.address,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    password: password ?? this.password,
    passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
    deviceToken: deviceToken ?? this.deviceToken,
    deviceType: deviceType ?? this.deviceType,
    image: image ?? this.image,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = "+20$phone";
    map['governorate_id'] = governorateId;
    map['city_id'] = cityId;
    map['address'] = address;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['password'] = "password";
    map['password_confirmation'] = "passwordConfirmation";
    map['device_token'] = deviceToken;
    map['device_type'] = deviceType;
    map.removeWhere((key, value) => value == null);
    return map;
  }

  Future<FormData> toFormData() async {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = "+20$phone";
    map['governorate_id'] = governorateId;
    map['city_id'] = cityId;
    map['address'] = address;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['password'] = "password";
    map['password_confirmation'] = "password";
    map['device_token'] = deviceToken;
    map['device_type'] = deviceType;
    if (image != null) {
      map['profile_image'] = await MultipartFile.fromFile(
        image!,
        filename: "profile",
      );
    }
    map.removeWhere((key, value) => value == null);
    return FormData.fromMap(map);
  }
}
