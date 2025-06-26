import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/services/storage_service.dart';

class SettingsController extends BaseController {

  Future<void> logout(Function()? onSuccess)async{
    final StorageService storageService = locator<StorageService>();
    await storageService.clearSession();
    onSuccess?.call();
  }

}
