import 'package:bloc/bloc.dart';
import 'package:bond/core/bloc/helper/base_state.dart';
import 'package:bond/features/notifications/data/models/notification_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/bloc/helper/either_extensions.dart';
import '../../data/repositories/notification_repository.dart';

@injectable
class NotificationsCubit extends Cubit<BaseState<List<NotificationModel>>>
    with AsyncHandler<List<NotificationModel>> {
  final NotificationRepositoryImpl notificationRepositoryImpl;

  NotificationsCubit(this.notificationRepositoryImpl) : super(BaseState());

  Future<void> getAllNotifications() async {
    await handleAsync(
      call: () => notificationRepositoryImpl.getAllNotifications(),
      onSuccess: (data) => data,
      identifier: "getNotifications",
    );
  }

  Future<void> deleteNotification({required String id}) async {
    await handleAsync(
      call: () => notificationRepositoryImpl.deleteNotification(id: id),
      onSuccess: (data) => state.data ?? [],
      identifier: "deleteNotifications",
    );
  }
}
