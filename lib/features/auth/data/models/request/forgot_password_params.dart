class ForgotPasswordParams {
  final String email;

  const ForgotPasswordParams({required this.email});

  Map<String, dynamic> toJson() => {'email': email};
}

class ResetPasswordParams {
  final String email;
  final String otpCode;
  final String password;
  final String passwordConfirmation;
  final String? deviceToken;
  final String? deviceType;

  const ResetPasswordParams({
    required this.email,
    required this.otpCode,
    required this.password,
    required this.passwordConfirmation,
    this.deviceToken,
    this.deviceType,
  });

  ResetPasswordParams copyWith({
    String? email,
    String? otpCode,
    String? password,
    String? passwordConfirmation,
    String? deviceToken,
    String? deviceType,
  }) {
    return ResetPasswordParams(
      email: email ?? this.email,
      otpCode: otpCode ?? this.otpCode,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      deviceToken: deviceToken ?? this.deviceToken,
      deviceType: deviceType ?? this.deviceType,
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'otp_code': otpCode,
    'password': password,
    'password_confirmation': passwordConfirmation,
    if (deviceToken != null) 'device_token': deviceToken,
    if (deviceType != null) 'device_type': deviceType,
  };
}





