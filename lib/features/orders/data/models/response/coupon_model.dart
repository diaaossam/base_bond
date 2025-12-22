class CouponModel {
  CouponModel({
    this.isValid,
    this.couponCode,
    this.coupon,
  });

  CouponModel.fromJson(dynamic json) {
    isValid = json['is_valid'];
    couponCode = json['couponCode'];
    coupon = json['coupon'] != null ? Coupon.fromJson(json['coupon']) : null;
  }

  bool? isValid;
  Coupon? coupon;
  String? couponCode;

  CouponModel copyWith({
    bool? isValid,
    Coupon? coupon,
    String? couponCode,
  }) =>
      CouponModel(
        couponCode: couponCode ?? this.couponCode,
        isValid: isValid ?? this.isValid,
        coupon: coupon ?? this.coupon,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_valid'] = isValid;
    map['couponCode'] = couponCode;
    if (coupon != null) {
      map['coupon'] = coupon?.toJson();
    }
    return map;
  }
}

class Coupon {
  Coupon({
    this.type,
    this.value,
    this.startDate,
    this.endDate,
  });

  Coupon.fromJson(dynamic json) {
    type = json['type'];
    value = json['value'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  String? type;
  num? value;
  String? startDate;
  String? endDate;

  Coupon copyWith({
    String? type,
    num? value,
    String? startDate,
    String? endDate,
  }) =>
      Coupon(
        type: type ?? this.type,
        value: value ?? this.value,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['value'] = value;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    return map;
  }
}
