import 'package:get/get.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/classes/user_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/services/storage_service.dart';

class SplashController extends BaseController {
  final StorageService _storageService = locator<StorageService>();
  final UserController _userController = Get.find<UserController>();

  @override
  void onInit() {
    super.onInit();
    _startNavigation();
  }

  void _startNavigation() {
    Future.delayed(const Duration(seconds: 1), () async {
      if (await (_storageService.isOnBoardVisited)) {
        final accessToken = await _storageService.accessToken;
        if (accessToken.isNotEmpty) {
          final res = await _userController.getMyDetails();
          if (res != null) {
            if ((res.fullName?.isEmpty ?? true) ||
                (res.gender?.isEmpty ?? true) ||
                (res.dob == null)) {
              Get.toNamed(Routes.userDetailScreen);
            } else {
              Get.toNamed(Routes.appEntryScreen);
            }
          } else {
            Get.offAndToNamed(Routes.signUpScreen);
            await _storageService.clearSession();
          }
        } else {
          Get.toNamed(Routes.loginScreen);
        }
      } else {
        Get.toNamed(Routes.onBoardingScreen);
      }
    });
  }
}
