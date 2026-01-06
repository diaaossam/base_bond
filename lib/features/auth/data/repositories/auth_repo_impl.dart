import 'package:bond/features/auth/data/models/response/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/enum/social_enum.dart';
import '../../../../core/services/api/api_handler_mixin.dart';
import '../../../../core/services/network/error/failures.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/request/forgot_password_params.dart';
import '../models/request/login_params.dart';
import '../models/request/otp_params.dart';
import '../models/request/register_params.dart';

@LazySingleton()
class AuthRepositoryImpl with ApiHandlerMixin {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  Future<Either<Failure, UserModel>> verifyOtp({
    required OtpParams otpParams,
  }) async {
    final response = await handleApi(
      () => authRemoteDataSource.verifyOtp(otpParams: otpParams),
    );
    return response;
  }

  Future<Either<Failure, UserModel>> getUserData() async {
    final response = await handleApi(() => authRemoteDataSource.getUserData());
    return response;
  }

  Future<Either<Failure, bool>> logOut() async {
    final response = await handleApi(() => authRemoteDataSource.logOut());
    return response;
  }

  Future<Either<Failure, bool>> deleteUser() async {
    final response = await handleApi(() => authRemoteDataSource.deleteUser());
    return response;
  }

  Future<Either<Failure, UserModel>> loginUser({
    required LoginParams loginParams,
  }) async {
    final response = await handleApi(
      () => authRemoteDataSource.loginUser(loginParams: loginParams),
    );
    return response;
  }

  Future<Either<Failure, bool>> socialLogin({
    required SocialEnum socialEnum,
  }) async {
    final response = await handleApi(
      () => authRemoteDataSource.socialLogin(socialEnum: socialEnum),
    );
    return response;
  }

  Future<Either<Failure, bool>> updateUserData({
    required RegisterParams params,
  }) async {
    final response = await handleApi(
      () => authRemoteDataSource.updateUserData(params: params),
    );
    return response;
  }

  Future<Either<Failure, Unit>> register({
    required RegisterParams params,
  }) async {
    final response = await handleApi(
      () => authRemoteDataSource.register(params: params),
    );
    return response;
  }

  Future<Either<Failure, Unit>> forgotPassword({
    required ForgotPasswordParams params,
  }) async {
    final response = await handleApi(
      () => authRemoteDataSource.forgotPassword(params: params),
    );
    return response;
  }

  Future<Either<Failure, UserModel>> verifyForgotPassword({
    required ResetPasswordParams params,
  }) async {
    final response = await handleApi(
      () => authRemoteDataSource.verifyForgotPassword(params: params),
    );
    return response;
  }
}
