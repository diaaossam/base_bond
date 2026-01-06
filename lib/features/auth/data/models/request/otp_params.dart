class OtpParams {
  OtpParams({this.email, this.otpCode, this.deviceToken, this.deviceType});

  OtpParams.fromJson(dynamic json) {
    email = json['email'];
    otpCode = json['otp_code'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
  }

  String? email;
  String? otpCode;
  String? deviceToken;
  String? deviceType;

  OtpParams copyWith({
    String? email,
    String? otpCode,
    String? deviceToken,
    String? deviceType,
  }) => OtpParams(
    email: email ?? this.email,
    otpCode: otpCode ?? this.otpCode,
    deviceToken: deviceToken ?? this.deviceToken,
    deviceType: deviceType ?? this.deviceType,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['otp_code'] = otpCode;
    map['device_token'] = deviceToken;
    map['device_type'] = deviceType;
    return map;
  }
}
