import 'package:bond/core/services/api/end_points.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/services/api/dio_consumer.dart';
import '../models/notification_model.dart';

abstract class LocationRemoteDataSource {
  Future<List<NotificationModel>> getAllNotification();
}

@Injectable(as: LocationRemoteDataSource)
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final DioConsumer dioConsumer;

  LocationRemoteDataSourceImpl({required this.dioConsumer});

  @override
  Future<List<NotificationModel>> getAllNotification() async {
    return await dioConsumer.get(EndPoints.notfications).execute();
  }
}
