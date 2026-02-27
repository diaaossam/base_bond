import 'package:auto_route/auto_route.dart';
import 'package:bond/config/helper/token_helper.dart';
import 'package:bond/config/helper/token_repository.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:bond/core/services/caching/common_caching.dart';
import 'package:bond/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:bond/features/auth/data/models/response/user_model_helper.dart';
import 'package:bond/features/start/data/models/intro_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/utils/app_strings.dart';

abstract class InitRemoteDataSource {
  Future<PageRouteInfo> initUser();

  Future<List<IntroModel>> getIntro();
}

@Injectable(as: InitRemoteDataSource)
class RegisterRemoteDataSourceImpl implements InitRemoteDataSource {
  final DioConsumer dioConsumer;
  final SharedPreferences sharedPreferences;
  final TokenRepository tokenRepository;
  final AuthRemoteDataSource remoteDataSource;

  RegisterRemoteDataSourceImpl({
    required this.dioConsumer,
    required this.sharedPreferences,
    required this.tokenRepository,
    required this.remoteDataSource,
  });

  @override
  Future<PageRouteInfo> initUser() async {
    final userToken = await tokenRepository.getToken();

    final bool onBoarding =
        sharedPreferences.getBool(AppStrings.onBoarding) ?? false;
    if (!onBoarding) {
      return OnBoardingRoute();
    } else {
      if (userToken == null) {
        return LoginRoute();
      } else {
        TokenDataService().setTokenData(userToken);
        final response = await remoteDataSource.getUserData();
        UserDataService().setUserData(response);
        CommonCaching.address = response.address;
        return MainLayoutRoute();
      }
    }
  }

  @override
  Future<List<IntroModel>> getIntro() async {
    return await dioConsumer.get(EndPoints.intro).factory((json) {
      return json['data']
          .map<IntroModel>((e) => IntroModel.fromJson(e))
          .toList();
    }).execute();
  }
}
