import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../../../../core/services/api/end_points.dart';
import '../models/app_settings.dart';
import '../models/page_model.dart';

abstract class SettingsRemoteDataSource {
  Future<AppSettings> getAppSettings();

  Future<PageModel> getCustomPage({required num id});
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

  @override
  Future<PageModel> getCustomPage({required num id}) async {
    final response = await dioConsumer
        .get(EndPoints.pages(id.toString()))
        .factory((json) => PageModel.fromJson(json['data']))
        .execute();
    return response;
  }
}
