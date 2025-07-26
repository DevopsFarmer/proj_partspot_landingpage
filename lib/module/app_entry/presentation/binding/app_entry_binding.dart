import 'package:get/get.dart';
import 'package:partyspot/module/app_entry/presentation/controller/app_entry_controller.dart';
import 'package:partyspot/module/home/presentation/controller/home_controller.dart';

class AppEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppEntryController>(() => AppEntryController());
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
