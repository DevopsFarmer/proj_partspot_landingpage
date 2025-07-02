import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/login/presentation/controller/otp_controller.dart';
import 'package:partyspot/module/login/presentation/view/widgets/login_header.dart';
import 'package:partyspot/module/login/presentation/view/widgets/resend_otp_timer.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';

class OtpScreen extends StatelessWidget {
  final int? phoneNumber;
  final String? code;
  OtpScreen({super.key, required this.phoneNumber, required this.code});

  final OtpController controller = Get.find<OtpController>();

  List<TextEditingController> otpCtrls = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.patriarchColor, AppColor.orangeColor],
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
                    bottom: 80,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LoginOtpImageHeader(
                        imagePath: AppImages.otpImage,
                        text: StringConsts.enterOtp,
                      ),

                      OtpTextField(
                        handleControllers: (controllers) {
                          otpCtrls =
                              controllers
                                  .whereType<TextEditingController>()
                                  .toList();
                        },
                        numberOfFields: 6,
                        borderRadius: BorderRadius.circular(10),
                        fillColor: AppColor.colorEDEDED,
                        showFieldAsBox: true,
                        onSubmit: (val) {
                          debugPrint(val);
                          controller.otpCode = val;
                        },
                      ),

                      ResendOtpTimerWidget(
                        onResendTap: () {
                          otpCtrls.clear();
                          controller.onResendOtp(
                            code,
                            phoneNumber,
                            onSuccess: (val) {
                              // showSnackBar(text: val);
                            },
                          );
                        },
                        timeBuilder: () => controller.timer.value,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Obx(() {
                          return AppButton(
                            StringConsts.submit,
                            isEnabled: controller.otpCode.length == 6,
                            backgroundColor: AppColor.buttonOrange,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            onPressed: () {
                              controller.onVerifyOtp(
                                code,
                                phoneNumber,
                                onSuccess: (user) {
                                  if ((user?.fullName?.isEmpty ?? true) ||
                                      (user?.gender?.isEmpty ?? true) ||
                                      (user?.dob == null)){
                                    Get.offNamed(
                                      Routes.userDetailScreen,
                                      arguments: {RoutesArgument.fromEdit: false},
                                    );
                                  }else{
                                    Get.offNamed(
                                      Routes.appEntryScreen,
                                    );
                                  }
                                },
                              );
                            },
                          );
                        }),
                      ),
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
