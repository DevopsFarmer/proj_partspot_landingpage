import 'package:partyspot/module/settings/domain/repositories/setting_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/services/storage_service.dart';
import 'package:partyspot/utils/widgets/loader.dart';

class SettingsController extends BaseController {

  final SettingRepository _settingRepository = locator<SettingRepository>();

  Future<void> logout(Function()? onSuccess)async{
    final StorageService storageService = locator<StorageService>();
    await storageService.clearSession();
    onSuccess?.call();
  }
  Future<void> deleteAccount(Function()? onSuccess)async{
    try {
      FullScreenLoading.show();
      await _settingRepository.deleteAccount();
      FullScreenLoading.hide();
      onSuccess?.call();
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    }
    FullScreenLoading.hide();
  }

}
