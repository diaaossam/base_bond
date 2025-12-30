class CouponModel {
  CouponModel({this.isValid, this.couponCode, this.amount});

  CouponModel.fromJson(dynamic json) {
    isValid = json['valid'];
    couponCode = json['couponCode'];
    amount = json['discount_amount'];
  }

  bool? isValid;
  num? amount;
  String? couponCode;

  CouponModel copyWith({bool? isValid, num? amount, String? couponCode}) {
    return CouponModel(
      isValid: isValid ?? this.isValid,
      amount: amount ?? this.amount,
      couponCode: couponCode ?? this.couponCode,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['is_valid'] = isValid;
    map['couponCode'] = couponCode;
    map['discount_amount'] = amount;
    return map;
  }
}
