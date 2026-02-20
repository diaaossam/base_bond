class OtpParams {
  OtpParams({
    this.email,
    this.phone,
    this.otpCode,
    this.deviceToken,
    this.deviceType,
  });

  OtpParams.fromJson(dynamic json) {
    email = json['email'];
    phone = json['phone'];
    otpCode = json['otp_code'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
  }

  String? email;
  String? phone;
  String? otpCode;
  String? deviceToken;
  String? deviceType;

  OtpParams copyWith({
    String? email,
    String? phone,
    String? otpCode,
    String? deviceToken,
    String? deviceType,
  }) =>
      OtpParams(
        email: email ?? this.email,
        phone: phone ?? this.phone,
        otpCode: otpCode ?? this.otpCode,
        deviceToken: deviceToken ?? this.deviceToken,
        deviceType: deviceType ?? this.deviceType,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    if (phone != null) map['phone'] = '+20$phone';
    map['otp_code'] = otpCode;
    map['device_token'] = deviceToken;
    map['device_type'] = deviceType;
    return map;
  }
}
