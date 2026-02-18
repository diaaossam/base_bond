import 'package:bond/config/helper/context_helper.dart';
import 'package:bond/config/helper/token_helper.dart';
import 'package:bond/config/helper/token_repository.dart';
import 'package:bond/features/settings/presentation/widgets/settings_helper.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:bond/config/environment/environment_helper.dart' as env;
import '../../utils/api_config.dart';
import '../../utils/app_strings.dart';

@injectable
class AppInterceptors extends Interceptor {
  final TokenRepository _tokenDataSource;

  AppInterceptors(this._tokenDataSource);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 401) {
      final context = NavigationService.navigatorKey.currentContext;
      if (context != null) {
        SettingsHelper().showGuestDialog(context);
      }
      return;
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (TokenDataService().getTokenData() != null) {
      options.headers['Authorization'] =
          'Bearer ${TokenDataService().getTokenData()}';
    }
    options.headers[AppStrings.acceptLanguage] = ApiConfig.language?.name;
    options.headers[AppStrings.contentType] = AppStrings.applicationJson;
    options.headers[AppStrings.accept] = AppStrings.applicationJson;
    options.headers[AppStrings.xApiKey] = env.Environment.xApiKey;
    options.headers[AppStrings.version] = AppStrings.versionValue;

    return handler.next(options);
  }
}
