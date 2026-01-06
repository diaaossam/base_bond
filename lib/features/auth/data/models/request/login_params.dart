class LoginParams {
  LoginParams({this.email, this.password, this.deviceToken, this.deviceType});

  LoginParams.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
  }

  String? email;
  String? password;
  String? deviceToken;
  String? deviceType;

  LoginParams copyWith({
    String? email,
    String? password,
    String? deviceToken,
    String? deviceType,
  }) => LoginParams(
    email: email ?? this.email,
    password: password ?? this.password,
    deviceToken: deviceToken ?? this.deviceToken,
    deviceType: deviceType ?? this.deviceType,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['password'] = password;
    map['device_token'] = deviceToken;
    map['device_type'] = deviceType;
    return map;
  }
}
