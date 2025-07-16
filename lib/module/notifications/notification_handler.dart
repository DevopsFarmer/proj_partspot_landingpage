import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'local_notification_service.dart';

class NotificationHandler {
  static void initializeFCM() {
    // 1️⃣ Handle notification when app is terminated
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        print(
          "app opend from the teminated state::::: ${message}  ${message.notification?.title}",
        );
        _handleNavigationFromMessage(message);
      }
    });

    // 2️⃣ Foreground messages
    FirebaseMessaging.onMessage.listen((message) async {
      await LocalNotificationService.displayNotification(message);
    });

    // 3️⃣ App opened from background (tapped)
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      _handleNavigationFromMessage(message);
    });
  }

  static void _handleNavigationFromMessage(RemoteMessage message) {
    print(
      "handle func is called ::::::::::  ${message}   ${message.notification?.title}",
    );
    final data = message.data;
    final eventId = data['event_id'];

    if (eventId != null) {
      Get.toNamed('/eventDetails', arguments: {"eventId": eventId});
    }
  }

  /// Optional handler if triggered from local notification tap
  static void handleLocalTap(String payload) {
    print("local notification triggerr::::::  ${payload}  ");
    try {
      final data = jsonDecode(payload);
      final eventId = data['event_id'];
      if (eventId != null) {
        Get.toNamed('/eventDetails', arguments: {"eventId": eventId});
      }
    } catch (e) {
      print("Local tap decode error: $e");
    }
  }
}
