class RegisterParams {
  final String? name;
  final String? phone;
  final num? provinceId;
  final num? regionId;
  final String? uuid;
  final String? imagePath;

  RegisterParams(
      {this.name,
      this.phone,
      this.provinceId,
      this.regionId,
      this.uuid,
      this.imagePath});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      "name": name,
      "phone": phone,
      "region_id": regionId,
      "province_id": provinceId,
      if (uuid != null) "uuid": uuid
    };
    map.removeWhere(
      (key, value) => value == null,
    );
    return map;
  }
}
