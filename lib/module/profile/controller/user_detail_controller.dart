import 'package:get/get.dart';
import 'package:partyspot/module/login/data/models/login_response_model.dart';
import 'package:partyspot/module/login/domain/repositories/auth_repository.dart';
import 'package:partyspot/networking/model/error_response_model.dart';
import 'package:partyspot/utils/classes/base_controller.dart';
import 'package:partyspot/utils/classes/user_controller.dart';
import 'package:partyspot/utils/constants/service_const.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/loader.dart';
import 'package:partyspot/utils/widgets/snackbars.dart';

class UserDetailController extends BaseController {
  final AuthRepository _loginRepository = locator<AuthRepository>();
  final UserController _userController = Get.find<UserController>();

  String? fullName;
  String? email;
  String? profilePic;
  int? phoneNumber;

  User? user;

  final Rxn<String?> _countryCode = Rxn<String>('91');
  String? get countryCode => _countryCode.value;
  set countryCode(String? val) => _countryCode.value = val;

  final Rx<String?> _gender = Rxn<String>();
  String? get gender => _gender.value;
  set gender(String? val) => _gender.value = val;

  final Rxn<DateTime?> _selectedDate = Rxn<DateTime?>();
  DateTime? get selectedDate => _selectedDate.value;
  set selectedDate(DateTime? val) => _selectedDate.value = val;

  final RxBool isTncAcceptedRx = false.obs;

  bool get isTncAccepted => isTncAcceptedRx.value;
  set isTncAccepted(bool val) => isTncAcceptedRx.value = val;

  @override
  void onInit() {
    super.onInit();

    onGetUserDetail();

    ever<String>(errorMessageRx, (String msg) {
      Future.microtask(() {
        if (msg.isNotEmpty) {
          showSnackBar(text: errorMessage, isError: true);
          setErrorMessage('');
        }
      });
    });

    ever<String>(successMessageRX, (String msg) {
      Future.microtask(() {
        if (msg.isNotEmpty) {
          showSnackBar(text: successMessage);
          setErrorMessage('');
        }
      });
    });
  }

  Future<void> onUpdateProfile({void Function()? onSuccess}) async {
    try {
      FullScreenLoading.show();
      await _loginRepository.updateProfile(
        fullName: fullName,
        gender: gender,
        profilePicture: profilePic,
        dob: selectedDate?.toIso8601String(),
        email: email,
      );
      onSuccess?.call();
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    } finally {
      FullScreenLoading.hide();
    }
  }

  Future<void> onGetUserDetail() async {
    try {
      setBusy(true);
      final res = await _userController.getMyDetails();
      user = res;
      fullName = user?.fullName;
      email = user?.email;
      selectedDate = user?.dob;
      countryCode = user?.code;
      gender = user?.gender;
      phoneNumber = user?.phone;
    } on ErrorResponse catch (e) {
      setErrorMessage(e.message);
    } catch (e) {
      setErrorMessage(StringConsts.unExpectedError);
    }
    setBusy(false);
  }
}
