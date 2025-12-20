// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../core/bloc/global_cubit/global_cubit.dart' as _i913;
import '../../core/bloc/network/network_cubit.dart' as _i730;
import '../../core/services/api/app_interceptors.dart' as _i50;
import '../../core/services/api/dio_client.dart' as _i763;
import '../../core/services/api/dio_consumer.dart' as _i384;
import '../../core/services/network/error/api_error_handler.dart' as _i665;
import '../../core/services/network/internet_checker/netwok_info.dart'
    as _i1035;
import '../../core/services/social_login_service/apple_account_login.dart'
    as _i946;
import '../../core/services/social_login_service/google_account_login_service.dart'
    as _i845;
import '../../features/app/data/datasources/app_data_source.dart' as _i162;
import '../../features/app/data/repositories/app_repository.dart' as _i344;
import '../../features/app/presentation/cubit/app_cubit.dart' as _i222;
import '../../features/auth/data/datasources/auth_remote_data_source.dart'
    as _i107;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/presentation/cubit/login_cubit/login_cubit.dart'
    as _i153;
import '../../features/auth/presentation/cubit/register_cubit/register_cubit.dart'
    as _i1006;
import '../../features/auth/presentation/cubit/social_login/social_login_bloc.dart'
    as _i396;
import '../../features/main/data/datasources/main_remote_data_source.dart'
    as _i584;
import '../../features/main/data/repositories/main_repository_impl.dart'
    as _i411;
import '../../features/main/presentation/cubit/banner/banners_cubit.dart'
    as _i933;
import '../../features/main/presentation/cubit/category/category_cubit.dart'
    as _i844;
import '../../features/main/presentation/cubit/main/main_cubit.dart' as _i1051;
import '../../features/settings/data/datasources/settings_remote_data_source.dart'
    as _i188;
import '../../features/settings/data/repositories/settings_repo_impl.dart'
    as _i91;
import '../../features/settings/presentation/cubit/settings_cubit.dart'
    as _i792;
import '../../features/start/data/datasources/init_remote_data_source.dart'
    as _i95;
import '../../features/start/data/repositories/init_repo_impl.dart' as _i941;
import '../../features/start/presentation/cubit/boarding/on_boarding_cubit.dart'
    as _i1059;
import '../../features/start/presentation/cubit/start/start_cubit.dart' as _i33;
import '../helper/device_helper.dart' as _i620;
import '../helper/token_repository.dart' as _i734;
import 'external.dart' as _i379;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.dio);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i895.Connectivity>(() => registerModule.connectivity);
    gh.factory<_i116.GoogleSignIn>(() => registerModule.googleSignIn);
    gh.factory<_i558.FlutterSecureStorage>(() => registerModule.storage);
    gh.factory<_i892.FirebaseMessaging>(() => registerModule.firebaseMessaging);
    gh.factory<_i59.FirebaseAuth>(() => registerModule.firebaseAuth);
    gh.factory<_i398.FirebaseAnalytics>(() => registerModule.firebaseAnalytics);
    gh.factory<_i183.ImagePicker>(() => registerModule.imagePicker);
    gh.factory<_i730.NetworkCubit>(() => _i730.NetworkCubit());
    gh.factory<_i665.ApiErrorHandler>(() => _i665.ApiErrorHandler());
    gh.factory<_i1006.RegisterCubit>(() => _i1006.RegisterCubit());
    gh.factory<_i1051.MainCubit>(() => _i1051.MainCubit());
    gh.factory<_i1035.NetworkInfo>(() => _i1035.NetworkInfoImpl());
    gh.factory<_i620.DeviceHelper>(() => _i620.DeviceHelperImpl());
    gh.lazySingleton<_i1059.OnBoardingCubit>(
      () => _i1059.OnBoardingCubit(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i913.GlobalCubit>(
      () => _i913.GlobalCubit(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i734.TokenRepository>(
      () => _i734.TokenRepositoryImp(
        secureStorage: gh<_i558.FlutterSecureStorage>(),
      ),
    );
    gh.lazySingleton<_i946.AppleAccountLoginService>(
      () =>
          _i946.AppleAccountLoginService(firebaseAuth: gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i845.GoogleAccountLoginService>(
      () => _i845.GoogleAccountLoginService(
        googleSignIn: gh<_i116.GoogleSignIn>(),
        firebaseAuth: gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.factory<_i50.AppInterceptors>(
      () => _i50.AppInterceptors(gh<_i734.TokenRepository>()),
    );
    gh.lazySingleton<_i763.DioClient>(
      () => _i763.DioClient(
        client: gh<_i361.Dio>(),
        apiErrorHandler: gh<_i665.ApiErrorHandler>(),
        appInterceptors: gh<_i50.AppInterceptors>(),
      ),
    );
    gh.lazySingleton<_i384.DioConsumer>(
      () => _i384.DioConsumer(client: gh<_i763.DioClient>()),
    );
    gh.factory<_i584.MainRemoteDataSource>(
      () =>
          _i584.MainRemoteDataSourceImpl(dioConsumer: gh<_i384.DioConsumer>()),
    );
    gh.lazySingleton<_i162.AppDataSource>(
      () => _i162.AppRemoteDataSourceImpl(dioConsumer: gh<_i384.DioConsumer>()),
    );
    gh.lazySingleton<_i411.MainRepositoryImpl>(
      () => _i411.MainRepositoryImpl(
        mainRemoteDataSource: gh<_i584.MainRemoteDataSource>(),
      ),
    );
    gh.factory<_i933.BannersCubit>(
      () => _i933.BannersCubit(gh<_i411.MainRepositoryImpl>()),
    );
    gh.factory<_i844.CategoryCubit>(
      () => _i844.CategoryCubit(gh<_i411.MainRepositoryImpl>()),
    );
    gh.factory<_i95.InitRemoteDataSource>(
      () => _i95.RegisterRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.factory<_i188.SettingsRemoteDataSource>(
      () => _i188.SettingsRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
      ),
    );
    gh.lazySingleton<_i91.SettingsRepositoryImpl>(
      () => _i91.SettingsRepositoryImpl(
        settingsRemoteDataSource: gh<_i188.SettingsRemoteDataSource>(),
      ),
    );
    gh.factory<_i107.AuthRemoteDataSource>(
      () => _i107.AuthRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
        googleAccountLoginService: gh<_i845.GoogleAccountLoginService>(),
        sharedPreferences: gh<_i460.SharedPreferences>(),
        deviceHelper: gh<_i620.DeviceHelper>(),
        appleAccountLoginService: gh<_i946.AppleAccountLoginService>(),
      ),
    );
    gh.lazySingleton<_i344.AppRepositoryImpl>(
      () => _i344.AppRepositoryImpl(appDataSource: gh<_i162.AppDataSource>()),
    );
    gh.lazySingleton<_i941.InitRepo>(
      () =>
          _i941.InitRepo(initRemoteDataSource: gh<_i95.InitRemoteDataSource>()),
    );
    gh.factory<_i222.AppCubit>(
      () => _i222.AppCubit(gh<_i344.AppRepositoryImpl>()),
    );
    gh.factory<_i792.SettingsCubit>(
      () => _i792.SettingsCubit(gh<_i91.SettingsRepositoryImpl>()),
    );
    gh.factory<_i33.StartCubit>(() => _i33.StartCubit(gh<_i941.InitRepo>()));
    gh.lazySingleton<_i662.AuthRepositoryImpl>(
      () => _i662.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i107.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i153.LoginCubit>(
      () => _i153.LoginCubit(gh<_i662.AuthRepositoryImpl>()),
    );
    gh.factory<_i396.SocialLoginBloc>(
      () => _i396.SocialLoginBloc(gh<_i662.AuthRepositoryImpl>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i379.RegisterModule {}
