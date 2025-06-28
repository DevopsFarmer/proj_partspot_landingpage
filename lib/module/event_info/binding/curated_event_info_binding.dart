import 'package:get/get.dart';
import 'package:partyspot/module/event_info/controller/curated_event_info_controller.dart';

class CuratedEventInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CuratedEventInfoController>(() => CuratedEventInfoController());
  }
}
