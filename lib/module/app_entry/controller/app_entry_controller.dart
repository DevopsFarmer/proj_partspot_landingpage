import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:partyspot/utils/classes/base_controller.dart';

class AppEntryController extends BaseController {
  int selectedIndex = 0;

  updateIndex(int val) {
    selectedIndex = val;
    update();
  }

  bool hasRequestedNotification = false;

  void requestNotificationIfNeeded() async {
    if (!hasRequestedNotification) {
      hasRequestedNotification = true;
      await requestUserNotificationPermission();
    }
    final messaging = FirebaseMessaging.instance;
    final token = await messaging.getToken();
    if (token != null) {
      print('🎯 FCM Token: $token');
    }
  }

  Future<void> requestUserNotificationPermission() async {
    final messaging = FirebaseMessaging.instance;
    final settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}
