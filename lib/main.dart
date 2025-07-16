import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/firebase_options.dart';
import 'package:partyspot/module/bookings/data/repositories/my_booking_repository_impl.dart';
import 'package:partyspot/module/bookings/domain/repositories/my_booking_repository.dart';
import 'package:partyspot/module/curated_events_list/data/repositories/curated_events_list_repository_impl.dart';
import 'package:partyspot/module/curated_events_list/domain/repositories/curated_events_list_repository.dart';
import 'package:partyspot/module/home/data/repositories/home_repository_impl.dart';
import 'package:partyspot/module/home/domain/repositories/home_repository.dart';
import 'package:partyspot/module/login/data/auth_repository_impl.dart';
import 'package:partyspot/module/login/domain/repositories/auth_repository.dart';
import 'package:partyspot/module/notifications/local_notification_service.dart';
import 'package:partyspot/module/notifications/notification_handler.dart';
import 'package:partyspot/module/plan_a_wedding/data/plan_event_repository_impl.dart';
import 'package:partyspot/module/plan_a_wedding/domain/plan_event_repository.dart';
import 'package:partyspot/module/settings/data/repositories/setting_repository_impl.dart';
import 'package:partyspot/module/settings/domain/repositories/setting_repository.dart';
import 'package:partyspot/routes/app_routes.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/user_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/services/env_service.dart';
import 'package:partyspot/utils/services/storage_service.dart';

import 'networking/dio_injector.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Background notification handle karega (terminated ya background se)
  print("_firebaseMessagingBackgroundHandler::::::::::  ${message.data}");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (message.notification == null) {
    await LocalNotificationService.displayNotification(message);
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await LocalNotificationService.initialize();
  await _setupRepo();
  await _setupService();
  runApp(const MyApp());
}

_setupService() {
  AppEnv.setEnv = Env.dev;
  locator.registerLazySingleton<DioInjector>(() => DioInjector());
  locator.registerLazySingleton<StorageService>(() => StorageService());
  Get.put(UserController());
}

_setupRepo() {
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  locator.registerLazySingleton<PlanEventRepository>(
    () => PlanEventRepositoryImpl(),
  );
  locator.registerLazySingleton<MyBookingRepository>(
    () => MyBookingRepositoryImpl(),
  );
  locator.registerLazySingleton<CuratedEventsListRepository>(
    () => CuratedEventsRepositoryImpl(),
  );
  locator.registerLazySingleton<SettingRepository>(
    () => SettingRepositoryImpl(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    NotificationHandler.initializeFCM();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      getPages: AppRoutes.getRoutes(),
      title: 'Party Spot',
    );
  }
}
