class LoginParams {
  LoginParams({this.phone, this.password, this.deviceToken, this.deviceType});

  LoginParams.fromJson(dynamic json) {
    phone = json['phone'];
    password = json['password'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
  }

  String? phone;
  String? password;
  String? deviceToken;
  String? deviceType;

  LoginParams copyWith({
    String? phone,
    String? password,
    String? deviceToken,
    String? deviceType,
  }) => LoginParams(
    phone: phone ?? this.phone,
    password: password ?? this.password,
    deviceToken: deviceToken ?? this.deviceToken,
    deviceType: deviceType ?? this.deviceType,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
   // map['phone'] = phone;
    map['email'] = "diaaossam@yahoo.com";
    map['password'] = "123456";
    map['device_token'] = deviceToken;
    map['device_type'] = deviceType;
    return map;
  }
}
