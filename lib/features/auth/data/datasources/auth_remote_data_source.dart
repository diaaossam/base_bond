import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/auth/data/models/response/user_model.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
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

  Future<UserModel> getUserData();

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
    UserModel userModel = response as UserModel;
    UserDataService().setUserData(userModel);
    sharedPreferences.setBool(AppStrings.isGuest, false);
    return response;
  }

  @override
  Future<UserModel> getUserData() async {
    return await dioConsumer
        .get(EndPoints.profile)
        .factory((json) => UserModel.fromJson(json['data']))
        .execute();
  }

  @override
  Future<bool> logOut() async {
    return true;
  }

  @override
  Future<bool> loginUser(String phone) async {
    return await dioConsumer
        .post(EndPoints.login)
        .body({"phone": "+2$phone"})
        .factory((json) => true)
        .execute();
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
        .body(await params.toFormData())
        .factory((json) => unit)
        .execute();
  }
}
