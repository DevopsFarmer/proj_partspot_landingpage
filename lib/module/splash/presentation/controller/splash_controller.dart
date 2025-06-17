import 'package:get/get.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/services/storage_service.dart';

class SplashController extends BaseController {

  final StorageService _storageService = locator<StorageService>();

  @override
  void onInit() {
    super.onInit();
    _startNavigation();
  }

  void _startNavigation() {
    Future.delayed(const Duration(seconds: 1), () async{
      if(await (_storageService.isOnBoardVisited)){
        Get.toNamed(Routes.loginScreen);
      }else{
        Get.toNamed(Routes.onBoardingScreen);
      }
    });
  }
}
