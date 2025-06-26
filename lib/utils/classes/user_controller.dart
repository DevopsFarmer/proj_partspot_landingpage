import 'dart:developer';
import 'package:partyspot/module/login/data/models/login_response_model.dart';
import 'package:partyspot/module/login/domain/repositories/auth_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/services/storage_service.dart';

class UserController extends BaseController {


  final AuthRepository _loginRepository = locator<AuthRepository>();
  final StorageService _storageService = locator<StorageService>();

  User? userData;

  @override
  void onInit() {
    super.onInit();
    getMyDetails();
  }
  Future<User?> getMyDetails() async {
    try {
      setBusy(true);
      final accessToken = await _storageService.accessToken;
      if(accessToken.isNotEmpty){
        final res =  await _loginRepository.userDetail();
        userData = res?.data?.user;
        return userData ;
      }else{
        return null;
      }
    } catch (e) {
      ErrorResponse? errorResponse = e as ErrorResponse?;
      log(errorResponse?.message.toString() ?? '');
    } finally {
      setBusy(false);
    }
    return null;
  }
}
