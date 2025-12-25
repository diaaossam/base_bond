class OtpParams {
  OtpParams({
      this.phone, 
      this.otpCode, 
      this.deviceToken, 
      this.deviceType,});

  OtpParams.fromJson(dynamic json) {
    phone = json['phone'];
    otpCode = json['otp_code'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
  }
  String? phone;
  String? otpCode;
  String? deviceToken;
  String? deviceType;
OtpParams copyWith({  String? phone,
  String? otpCode,
  String? deviceToken,
  String? deviceType,
}) => OtpParams(  phone: phone ?? this.phone,
  otpCode: otpCode ?? this.otpCode,
  deviceToken: deviceToken ?? this.deviceToken,
  deviceType: deviceType ?? this.deviceType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = "+20${phone}";
    map['otp_code'] = otpCode;
    map['device_token'] = deviceToken;
    map['device_type'] = deviceType;
    return map;
  }

}