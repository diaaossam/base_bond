import 'package:bond/core/services/network/error/failures.dart';
import 'package:bond/features/notifications/data/models/notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/api/api_handler_mixin.dart';
import '../datasources/notifications_remote_data_source.dart';

@LazySingleton()
class NotificationRepositoryImpl with ApiHandlerMixin {
  final NotificationRemoteDataSource notificationRemoteDataSource;

  NotificationRepositoryImpl({required this.notificationRemoteDataSource});

  Future<Either<Failure, List<NotificationModel>>> getAllNotifications() async {
    return handleApi(() => notificationRemoteDataSource.getAllNotification());
  }

  Future<Either<Failure, String>> deleteNotification({required String id}) async {
    return handleApi(
      () => notificationRemoteDataSource.deleteNotification(id: id),
    );
  }
}
