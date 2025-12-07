import 'package:firebase_messaging/firebase_messaging.dart';
import 'local_notification_service.dart';
import 'notification_handling.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

class NotificationService {
  Future<String?> getDeviceToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  Future<void> initNotification() async {
    await LocalNotificationService().initializeNotification();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((event) async {
      await showNotification(event);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      if (message.data.isNotEmpty) {

      }
    });
  }
}
