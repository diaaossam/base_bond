import 'package:dio/dio.dart';

class RegisterParams {
  final String? name;
  final String? phone;
  final num? provinceId;
  final num? regionId;
  final String? uuid;
  final String? imagePath;

  RegisterParams({
    this.name,
    this.phone,
    this.provinceId,
    this.regionId,
    this.uuid,
    this.imagePath,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "phone": phone,
      "region_id": regionId,
      "province_id": provinceId,
      if (uuid != null) "uuid": uuid,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  Future<FormData> toFormData() async {
    final map = <String, dynamic>{
      "name": name,
      "phone": phone,
      "region_id": regionId,
      "province_id": provinceId,
      if (uuid != null) "uuid": uuid,
      if(imagePath != null)
        "profile_image": await MultipartFile.fromFile(
            imagePath.toString(), filename: "profile_image.png")
    };

    map.removeWhere((key, value) => value == null);

    return FormData.fromMap(map);
  }
}
