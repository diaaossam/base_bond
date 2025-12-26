import 'package:bond/features/settings/data/datasources/settings_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/api_handler_mixin.dart';
import '../../../../core/services/network/error/failures.dart';
import '../models/app_settings.dart';
import '../models/page_model.dart';

@LazySingleton()
class SettingsRepositoryImpl with ApiHandlerMixin {
  final SettingsRemoteDataSource settingsRemoteDataSource;

  SettingsRepositoryImpl({required this.settingsRemoteDataSource});

  Future<Either<Failure, AppSettings>> getAppSettings() async {
    final response = await handleApi(
      () => settingsRemoteDataSource.getAppSettings(),
    );
    return response;
  }

  Future<Either<Failure, PageModel>> getCustomPage({required int page}) async {
    final response = await handleApi(
      () => settingsRemoteDataSource.getCustomPage(id: page),
    );
    return response;
  }
}
