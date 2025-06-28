import 'package:get/get.dart';
import 'package:partyspot/module/curated_events_list/presentation/controller/curated_events_list_controller.dart';

class CuratedEventListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CuratedEventsListController>(() => CuratedEventsListController());
  }
}
