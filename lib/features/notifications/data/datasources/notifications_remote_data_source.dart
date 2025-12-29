import 'package:bond/core/services/api/converters_helper.dart';
import 'package:bond/core/services/api/end_points.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../models/notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<NotificationModel>> getAllNotification();

  Future<String> deleteNotification({required String id});
}

@Injectable(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final DioConsumer dioConsumer;

  NotificationRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<NotificationModel>> getAllNotification() async {
    await dioConsumer
        .post(EndPoints.markAllAsRead)
        .factory((json) => null)
        .execute();

    return await dioConsumer
        .get<List<NotificationModel>>(EndPoints.notfications)
        .execute(
          (json) => ConvertersHelper.fromJsonList<NotificationModel>(
            json,
            (item) => NotificationModel.fromJson(item),
          ),
        );
  }

  @override
  Future<String> deleteNotification({required String id}) async {
    return await dioConsumer
        .deleteRequest("${EndPoints.notfications}/$id")
        .factory((json) => json['message'])
        .execute();
  }
}
