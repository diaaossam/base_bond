import 'package:dio/dio.dart';

class RegisterParams {
  RegisterParams({
    this.name,
    this.phone,
    this.governorateId,
    this.cityId,
    this.address,
    this.latitude,
    this.longitude,
    this.deviceToken,
    this.deviceType,
    this.image,
  });

  String? name;
  String? phone;
  num? governorateId;
  num? cityId;
  String? address;
  String? latitude;
  String? longitude;
  String? deviceToken;
  String? deviceType;
  String? image;

  RegisterParams copyWith({
    String? name,
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
    phone: phone ?? this.phone,
    governorateId: governorateId ?? this.governorateId,
    cityId: cityId ?? this.cityId,
    address: address ?? this.address,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    deviceToken: deviceToken ?? this.deviceToken,
    deviceType: deviceType ?? this.deviceType,
    image: image ?? this.image,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = "+20$phone";
    map['governorate_id'] = governorateId;
    map['city_id'] = cityId;
    map['address'] = address;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['device_token'] = deviceToken;
    map['device_type'] = deviceType;
    map.removeWhere((key, value) => value == null);
    return map;
  }

  Future<FormData> toFormData() async {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = "+20$phone";
    map['governorate_id'] = governorateId;
    map['city_id'] = cityId;
    map['address'] = address;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['device_token'] = deviceToken;
    map['device_type'] = deviceType;
    if (image != null) {
      map['profile_image'] = await MultipartFile.fromFile(
        image!,
      );
    }
    map.removeWhere((key, value) => value == null);
    return FormData.fromMap(map);
  }
}
