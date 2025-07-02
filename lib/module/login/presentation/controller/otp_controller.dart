import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/login/data/models/login_response_model.dart';
import 'package:partyspot/module/login/domain/repositories/auth_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/services/storage_service.dart';
import 'package:partyspot/utils/widgets/loader.dart';
import 'package:partyspot/utils/widgets/snackbars.dart';
import 'package:path/path.dart';

class OtpController extends BaseController {

  final AuthRepository _loginRepository = locator<AuthRepository>();
  final StorageService _storageService = locator<StorageService>();

  final RxInt timer = 20.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    ever<String>(errorMessageRx, (String msg) {
      Future.microtask((){
        if (msg.isNotEmpty) {
          showSnackBar(text: errorMessage, isError: true);
          setErrorMessage('');
        }
      });
    });

    ever<String>(successMessageRX, (String msg) {
      Future.microtask((){
        if (msg.isNotEmpty) {
          showSnackBar(text: successMessage);
          setErrorMessage('');
        }
      });
    });

    startTimer();
  }

  Timer? _debounce;

  void startTimer() async{
    _timer?.cancel();
    timer.value = 20;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.timer.value <= 0) {
        timer.cancel();
      } else {
        this.timer.value--;
      }
    });

  }



  final Rx<String> _otpCode = Rx<String>('');
  String get otpCode => _otpCode.value;
  set otpCode(String val) => _otpCode.value = val;

  Future<void> onVerifyOtp(String? code,int? phoneNumber,{void Function(User? user)? onSuccess}) async {
    try {
      FullScreenLoading.show();
      final pushToken = await getPushToken();
      final res = await _loginRepository.verifyOTP(code: code,phoneNumber: phoneNumber,otp: otpCode,pushToken: pushToken);
      _storageService.setAccessToken(res?.data?.accessToken);
      onSuccess?.call(res?.data?.user);
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    }
    FullScreenLoading.hide();
  }

  Future<String?> getPushToken() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
    } catch (_) {}
    return FirebaseMessaging.instance.getToken();
  }

  Future<void> onResendOtp(String? code, int? phone,{void Function(String? otp)? onSuccess}) async {
    try {
      FullScreenLoading.show();
      final res = await _loginRepository.resendOtp(code: code,phoneNumber: phone);
      onSuccess?.call(res?.data?.otp);
      setSuccessMessage('${res?.message} ${res?.data?.otp}');
      startTimer();
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError,error: e);
    }
    FullScreenLoading.hide();
  }


  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _debounce?.cancel();
  }
}
