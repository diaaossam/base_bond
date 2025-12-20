import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../models/app_settings.dart';

abstract class SettingsRemoteDataSource {
  Future<AppSettings> getAppSettings();
}

@Injectable(as: SettingsRemoteDataSource)
class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final DioConsumer dioConsumer;

  SettingsRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<AppSettings> getAppSettings() async {
    final response = await dioConsumer
        .get(EndPoints.appSettings)
        .factory(AppSettings.fromJson)
        .execute();
    return response;
  }
}
