import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:partyspot/module/app_entry/domain/app_entry_repository.dart';
import 'package:partyspot/module/app_entry/data/models/events_meta.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class AppEntryController extends BaseController{
  int selectedIndex = 0;

  updateIndex(int val){
    selectedIndex = val;
    update();
  }

  final AppEntryRepository _appEntryRepository = locator<AppEntryRepository>();

  final Rxn<EventsMetaDataResponse?> _eventMetaData = Rxn<EventsMetaDataResponse?>();
  EventsMetaDataResponse? get eventMetaData => _eventMetaData.value;
  set eventMetaData(EventsMetaDataResponse? busy) {
    _eventMetaData.value = busy;
  }

  @override
  void onInit() {
    super.onInit();
    getMetaData();
    FirebaseMessaging.instance.subscribeToTopic('all_users');
  }

  Future<void> getMetaData({void Function()? onSuccess}) async {
    try {
      setBusy(true);
      update();
      eventMetaData = await _appEntryRepository.getEventMetaData();
      onSuccess?.call();
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    } finally{
      setBusy(false);
      update();
    }
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