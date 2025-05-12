import 'package:get/get.dart';
import 'package:partyspot/module/explore/controller/explore_controller.dart';

class ExploreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExploreController>(() => ExploreController());
  }
}
