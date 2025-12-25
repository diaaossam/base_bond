import 'package:auto_route/auto_route.dart';
import 'package:bond/config/helper/token_helper.dart';
import 'package:bond/config/helper/token_repository.dart';
import 'package:bond/config/router/app_router.gr.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/utils/app_strings.dart';

abstract class InitRemoteDataSource {
  Future<PageRouteInfo> initUser();
}

@Injectable(as: InitRemoteDataSource)
class RegisterRemoteDataSourceImpl implements InitRemoteDataSource {
  final DioConsumer dioConsumer;
  final SharedPreferences sharedPreferences;
  final TokenRepository tokenRepository;

  RegisterRemoteDataSourceImpl({
    required this.dioConsumer,
    required this.sharedPreferences,
    required this.tokenRepository,
  });

  @override
  Future<PageRouteInfo> initUser() async {
    final userToken = await tokenRepository.getToken();
    final bool onBoarding = sharedPreferences.getBool(AppStrings.onBoarding) ?? false;
    if (!onBoarding) {
      return OnBoardingRoute();
    } else {
      if (userToken == null) {
        return LoginRoute();
      } else {
        TokenDataService().setTokenData(userToken);
        return MainLayoutRoute();
      }
    }
  }
}
