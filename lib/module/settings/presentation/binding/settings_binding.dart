import 'package:get/get.dart';
import 'package:partyspot/module/settings/presentation/controller/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
