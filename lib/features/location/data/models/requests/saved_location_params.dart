class SavedLocationParams {
  final num? provinceId;
  final num? regionId;
  final double? lat;
  final double? lng;
  final String? name;
  final String? phone;
  final String? address;
  final String? notes;

  SavedLocationParams(
      {this.provinceId,
      this.regionId,
      this.lat,
      this.lng,
      this.name,
      this.phone,
      this.address,
      this.notes});

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['province_id'] = provinceId;
    map['region_id'] = regionId;
    map['lat'] = lat;
    map['lng'] = lng;
    map['name'] = name;
    map['address'] = address;
    map['phone'] = phone;
    map['notes'] = notes;
    return map;
  }
}
