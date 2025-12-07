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
import 'package:firebase_messaging/firebase_messaging.dart' as _i892;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:image_picker/image_picker.dart' as _i183;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../core/bloc/global_cubit/global_cubit.dart' as _i913;
import '../../core/services/api/app_interceptors.dart' as _i50;
import '../../core/services/api/dio_client.dart' as _i763;
import '../../core/services/api/dio_consumer.dart' as _i384;
import '../../core/services/network/error/api_error_handler.dart' as _i665;
import '../../core/services/network/internet_checker/netwok_info.dart'
    as _i1035;
import '../../features/start/data/datasources/init_remote_data_source.dart'
    as _i95;
import '../../features/start/data/repositories/init_repo_impl.dart' as _i941;
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
    gh.factory<_i558.FlutterSecureStorage>(() => registerModule.storage);
    gh.factory<_i892.FirebaseMessaging>(() => registerModule.firebaseMessaging);
    gh.factory<_i398.FirebaseAnalytics>(() => registerModule.firebaseAnalytics);
    gh.factory<_i183.ImagePicker>(() => registerModule.imagePicker);
    gh.factory<_i665.ApiErrorHandler>(() => _i665.ApiErrorHandler());
    gh.factory<_i1035.NetworkInfo>(() => _i1035.NetworkInfoImpl());
    gh.factory<_i913.GlobalCubit>(
      () => _i913.GlobalCubit(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i620.DeviceHelper>(() => _i620.DeviceHelperImpl());
    gh.factory<_i734.TokenRepository>(
      () => _i734.TokenRepositoryImp(
        secureStorage: gh<_i558.FlutterSecureStorage>(),
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
    gh.factory<_i95.InitRemoteDataSource>(
      () => _i95.RegisterRemoteDataSourceImpl(
        dioConsumer: gh<_i384.DioConsumer>(),
        sharedPreferences: gh<_i460.SharedPreferences>(),
      ),
    );
    gh.lazySingleton<_i941.InitRepo>(
      () =>
          _i941.InitRepo(initRemoteDataSource: gh<_i95.InitRemoteDataSource>()),
    );
    gh.factory<_i33.StartCubit>(() => _i33.StartCubit(gh<_i941.InitRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i379.RegisterModule {}
