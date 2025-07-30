import 'dart:convert';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:partyspot/module/notifications/notification_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iOSSettings = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iOSSettings,
    );

    await _notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        print(
          "print payload and others:::  ${details}  ${details.notificationResponseType}  ${details.data}   ${details.payload}",
        );
        if (details.payload != null && details.payload!.isNotEmpty) {
          NotificationHandler.handleLocalTap(details.payload!);
        }
      },
    );

    const androidChannel = AndroidNotificationChannel(
      'general_channel',
      'General Notifications',
      description: 'This channel is used for general notifications',
      importance: Importance.max,
    );

    await _notificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(androidChannel);
  }

  static Future<void> displayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final imageUrl = message.data['image'];
      BigPictureStyleInformation? styleInfo;

      if (imageUrl != null && imageUrl.isNotEmpty) {
        final filePath = await _downloadAndSaveFile(
          imageUrl,
          'notif_image.jpg',
        );
        if (filePath != null) {
          styleInfo = BigPictureStyleInformation(
            FilePathAndroidBitmap(filePath),
            largeIcon: FilePathAndroidBitmap(filePath),
            contentTitle: message.notification?.title,
            summaryText: message.notification?.body,
          );
        }
      }

      final notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'general_channel',
          'General Notifications',
          channelDescription: 'This channel is used for general notifications',
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: styleInfo,
        ),
        iOS: const DarwinNotificationDetails(),
      );

      print("showing the notification::::::::: ${message.notification?.title}");
      await _notificationsPlugin.show(
        id,
        message.notification?.title ?? 'Party Spot',
        message.notification?.body ?? '',
        notificationDetails,
        payload: jsonEncode(message.data),
      );
    } catch (e) {
      print("Notification display error: $e");
    }
  }

  static Future<String?> _downloadAndSaveFile(
    String url,
    String fileName,
  ) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/$fileName';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);
        return filePath;
      }
    } catch (e) {
      print("Image download error: $e");
    }
    return null;
  }
}
