class SavedLocationParams {
  final num? provinceId;
  final num? regionId;
  final double? lat;
  final double? lng;
  final String? name;
  final String? address;
  final String? notes;
  final bool isDefault;

  SavedLocationParams({
    this.provinceId,
    this.regionId,
    this.lat,
    this.lng,
    this.name,
    this.address,
    this.notes,
    this.isDefault = false,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['governorate_id'] = provinceId;
    map['city_id'] = regionId;
    map['latitude'] = lat.toString();
    map['longitude'] = lng.toString();
    map['street_address'] = name;
    map['address'] = address;
    map['additional_notes'] = notes;
    map['is_default'] = isDefault;
    return map;
  }
}
