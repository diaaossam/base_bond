import 'package:bond/features/auth/data/models/response/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../../../../config/helper/device_helper.dart';
import '../../../../core/enum/social_enum.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../../../../core/services/social_login_service/apple_account_login.dart';
import '../../../../core/services/social_login_service/google_account_login_service.dart';
import '../models/request/otp_params.dart';
import '../models/request/register_params.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> verifyOtp({required OtpParams otpParams});

  Future<bool> deleteUser();

  Future<bool> logOut();

  Future<bool> getUserData();

  Future<bool> loginUser(String phone);

  Future<bool> socialLogin({required SocialEnum socialEnum});

  Future<bool> updateUserData({required RegisterParams params});

  Future<Unit> register({required RegisterParams params});
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioConsumer dioConsumer;
  final SharedPreferences sharedPreferences;
  final GoogleAccountLoginService googleAccountLoginService;
  final AppleAccountLoginService appleAccountLoginService;
  final DeviceHelper deviceHelper;

  AuthRemoteDataSourceImpl({
    required this.dioConsumer,
    required this.googleAccountLoginService,
    required this.sharedPreferences,
    required this.deviceHelper,
    required this.appleAccountLoginService,
  });

  @override
  Future<UserModel> verifyOtp({required OtpParams otpParams}) async {
    otpParams = otpParams.copyWith(
      deviceToken: await deviceHelper.deviceToken,
      deviceType: deviceHelper.devicePlatform,
    );
    final data = otpParams.toJson();

    final response = await dioConsumer
        .post(EndPoints.verifyUser, data: data)
        .factory(UserModel.fromJson)
        .cacheToken()
        .execute();
    return response;
  }

  @override
  Future<bool> getUserData() async {
    return true;
  }

  @override
  Future<bool> logOut() async {
    return true;
  }

  @override
  Future<bool> loginUser(String phone) async {
    return true;
  }

  @override
  Future<bool> deleteUser() async {
    return true;
  }

  @override
  Future<bool> socialLogin({required SocialEnum socialEnum}) async {
    if (socialEnum == SocialEnum.google) {
      await googleAccountLoginService.login();
    }
    if (socialEnum == SocialEnum.apple) {
      await appleAccountLoginService.login();
    }
    return true;
  }

  @override
  Future<bool> updateUserData({required RegisterParams params}) async {
    return true;
  }

  @override
  Future<Unit> register({required RegisterParams params}) async {
    params = params.copyWith(
      deviceToken: await deviceHelper.deviceToken,
      deviceType: deviceHelper.devicePlatform,
    );
    return await dioConsumer
        .post(EndPoints.register)
        .body(params.toJson())
        .factory((json) => unit)
        .execute();
  }
}
