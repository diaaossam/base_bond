import 'package:bond/config/helper/token_repository.dart';
import 'package:bond/core/services/caching/common_caching.dart';
import 'package:bond/core/utils/api_config.dart';
import 'package:bond/core/utils/app_strings.dart';
import 'package:bond/features/auth/data/models/response/user_model.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../config/helper/device_helper.dart';
import '../../../../core/enum/social_enum.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../../../../core/services/social_login_service/apple_account_login.dart';
import '../../../../core/services/social_login_service/google_account_login_service.dart';
import '../models/request/forgot_password_params.dart';
import '../models/request/login_params.dart';
import '../models/request/otp_params.dart';
import '../models/request/register_params.dart';
import '../models/request/social_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> verifyOtp({required OtpParams otpParams});

  Future<Unit> resendOtp({required String phone});

  Future<bool> deleteUser();

  Future<bool> logOut();

  Future<UserModel> getUserData();

  Future<UserModel> loginUser({required LoginParams loginParams});

  Future<bool> socialLogin({required SocialEnum socialEnum});

  Future<bool> updateUserData({required RegisterParams params});

  Future<Unit> register({required RegisterParams params});

  Future<Unit> forgotPassword({required ForgotPasswordParams params});

  Future<UserModel> verifyForgotPassword({required ResetPasswordParams params});
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioConsumer dioConsumer;
  final SharedPreferences sharedPreferences;
  final GoogleAccountLoginService googleAccountLoginService;
  final AppleAccountLoginService appleAccountLoginService;
  final TokenRepository tokenRepository;
  final DeviceHelper deviceHelper;

  AuthRemoteDataSourceImpl({
    required this.dioConsumer,
    required this.googleAccountLoginService,
    required this.sharedPreferences,
    required this.deviceHelper,
    required this.appleAccountLoginService,
    required this.tokenRepository,
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
        .factory((json) => UserModel.fromJson(json['data']['user']))
        .cacheToken()
        .execute();
    UserDataService().setUserData(response);
    CommonCaching.address = (response as UserModel).address;
    sharedPreferences.setBool(AppStrings.isGuest, false);
    await ApiConfig().init();
    return response;
  }

  @override
  Future<Unit> resendOtp({required String phone}) async {
    await dioConsumer
        .post(EndPoints.resendOtp)
        .body({'phone': '+20$phone'})
        .factory((json) => true)
        .execute();
    return unit;
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
    final response = await dioConsumer
        .post(EndPoints.logOut)
        .factory((json) => true)
        .execute();
    await sharedPreferences.clear();
    await tokenRepository.deleteToken();
    await ApiConfig().init();
    return response;
  }

  @override
  Future<UserModel> loginUser({required LoginParams loginParams}) async {
    final data = await dioConsumer
        .post(EndPoints.login)
        .body(loginParams.toJson())
        .factory((json) => UserModel.fromJson(json['data']['user']))
        .cacheToken()
        .execute();
    UserDataService().setUserData(data);
    CommonCaching.address = (data as UserModel).address;
    sharedPreferences.setBool(AppStrings.isGuest, false);
    await ApiConfig().init();
    return data;
  }

  @override
  Future<bool> deleteUser() async {
    return true;
  }

  @override
  Future<bool> socialLogin({required SocialEnum socialEnum}) async {
    SocialModel? socialModel;
    if (socialEnum == SocialEnum.google) {
      socialModel = await googleAccountLoginService.login();
    }
    if (socialEnum == SocialEnum.apple) {
      socialModel = await appleAccountLoginService.login();
    }
    print(socialModel?.uid);
    final response = await dioConsumer
        .post(EndPoints.socialLogin)
        .body({"uid": socialModel?.uid})
        .factory((json) => UserModel.fromJson(json['data']['user']))
        .cacheToken()
        .execute();

    UserDataService().setUserData(response);
    CommonCaching.address = (response as UserModel).address;
    sharedPreferences.setBool(AppStrings.isGuest, false);
    await ApiConfig().init();
    return true;
  }

  @override
  Future<bool> updateUserData({required RegisterParams params}) async {
    final response = await dioConsumer
        .post(EndPoints.update)
        .body(await params.toFormData())
        .factory((json) => true)
        .execute();
    final updatedUser = await getUserData();
    UserDataService().setUserData(updatedUser);
    return response;
  }

  @override
  Future<Unit> register({required RegisterParams params}) async {
    params = params.copyWith(
      deviceToken: await deviceHelper.deviceToken,
      deviceType: deviceHelper.devicePlatform,
    );

    final response = await dioConsumer
        .post(EndPoints.register)
        .body(await params.toFormData())
        .factory((json) => UserModel.fromJson(json['data']['user']))
        .execute();

    UserDataService().setUserData(response);
    CommonCaching.address = (response as UserModel).address;
    sharedPreferences.setBool(AppStrings.isGuest, false);
    await ApiConfig().init();
    return unit;
  }

  @override
  Future<Unit> forgotPassword({required ForgotPasswordParams params}) async {
    await dioConsumer
        .post(EndPoints.forgotPassword)
        .body(params.toJson())
        .factory((json) => true)
        .execute();
    return unit;
  }

  @override
  Future<UserModel> verifyForgotPassword({
    required ResetPasswordParams params,
  }) async {
    params = params.copyWith(
      deviceToken: await deviceHelper.deviceToken,
      deviceType: deviceHelper.devicePlatform,
    );

    final response = await dioConsumer
        .post(EndPoints.verifyForgotPassword)
        .body(params.toJson())
        .factory((json) => UserModel.fromJson(json['data']['user']))
        .cacheToken()
        .execute();

    UserDataService().setUserData(response);
    CommonCaching.address = (response as UserModel).address;
    sharedPreferences.setBool(AppStrings.isGuest, false);
    await ApiConfig().init();
    return response;
  }
}
