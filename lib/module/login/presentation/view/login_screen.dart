import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/login/presentation/controller/login_controller.dart';

import 'package:partyspot/module/login/presentation/view/widgets/login_header.dart';
import 'package:partyspot/module/login/presentation/view/widgets/phone_input_textfield.dart';
import 'package:partyspot/module/login/presentation/view/widgets/social_login_section.dart';
import 'package:partyspot/routes/routes_const.dart';

import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/snackbars.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController numberController = TextEditingController();
  final ValueNotifier<String> selectedCountry = ValueNotifier<String>("🇮🇳");

  final LoginController loginController = Get.find<LoginController>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedCountryCode = "+91";

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.deepPurple, AppColor.deepOrange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 60,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LoginOtpImageHeader(
                        imagePath: AppImages.loginImage,
                        text: StringConsts.Login,
                      ),
                      PhoneInputField(
                        controller: numberController,
                        countryFlagNotifier: selectedCountry,
                        onChangeCountryCode: (String? val) {
                          selectedCountryCode = val;
                        },
                      ),
                      AppButton(
                        StringConsts.next,
                        backgroundColor: AppColor.buttonOrange,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        onPressed: () {
                          loginController.onPhoneLogin(
                            selectedCountryCode,
                            int.tryParse(numberController.text) ?? 0,
                            onSuccess: (otp) {
                              Get.offNamed(
                                Routes.otpScreen,
                                arguments: {
                                  RoutesArgument.phoneNumber: num.tryParse(
                                    numberController.text,
                                  ),
                                  RoutesArgument.code: selectedCountryCode,
                                },
                              );
                              showSnackBar(
                                text: otp,
                                duration: Duration(seconds: 5),
                              );
                            },
                          );
                        },
                      ),
                      // SocialLoginSection(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
