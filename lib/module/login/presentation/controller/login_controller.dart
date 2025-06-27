import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart' show GoogleSignIn, GoogleSignInAuthentication;
import 'package:partyspot/module/login/domain/repositories/auth_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/loader.dart';
import 'package:partyspot/utils/widgets/snackbars.dart';

class LoginController extends BaseController {
  final AuthRepository _loginRepository = locator<AuthRepository>();
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);

  @override
  Future<void> onInit() async {
    super.onInit();
    ever<String>(errorMessageRx, (String msg) {
      Future.microtask((){
        if (msg.isNotEmpty) {
          showSnackBar(text: errorMessage, isError: true);
          setErrorMessage('');
        }
      });
    });
  }

  Future<void> onGoogleSignIn({void Function()? onSuccess}) async {
    try {
      FullScreenLoading.show();

      final pushToken = await getPushToken();
      final googleAuth = await signInWithGoogle();

      if (googleAuth == null) {
        throw ErrorResponse(message: "Google sign-in failed");
      }

      await _loginRepository.socialLogin(
        idToken: googleAuth.accessToken,
        provider: 'google',
        pushToken: pushToken,
      );
      onSuccess?.call();
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError,error: e);
    }
    FullScreenLoading.hide();
  }

  Future<String?> getPushToken() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
    } catch (_) {}
    return FirebaseMessaging.instance.getToken();
  }

  Future<GoogleSignInAuthentication?> signInWithGoogle() async {
    await _googleSignIn.signOut();
    final googleUser = await _googleSignIn.signIn();
    return googleUser?.authentication;
  }

  Future<void> onPhoneLogin(String? code, int? phone,{void Function(String? otp)? onSuccess}) async {
    try {
      FullScreenLoading.show();
      final res = await _loginRepository.phoneLogin(code: code,phoneNumber: phone);
      onSuccess?.call(res?.data?.otp);
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError,error: e);
    }
    FullScreenLoading.hide();
  }
}
