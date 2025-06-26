import 'package:flutter/material.dart';
import 'package:partyspot/module/settings/controller/settings_controller.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/alert_dialogs/image_popup.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),
      builder: (settingsController){
        return Container(
          width: double.infinity,
          color: AppColor.whiteColor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  children: [
                    profileListItem(
                      imagePath: AppImages.profileIcon,
                      onTap: () {
                        Get.toNamed(
                          Routes.userDetailScreen,
                          arguments: {RoutesArgument.fromEdit: true},
                        );
                      },
                      title: StringConsts.editProfile,
                    ),
                    profileListItem(
                      imagePath: AppImages.bookingIcon,
                      onTap: () {
                        Get.toNamed(Routes.bookingScreen);
                      },
                      title: StringConsts.myBookings,
                    ),
                    profileListItem(
                      imagePath: AppImages.reviewIcon,
                      onTap: () {},
                      title: StringConsts.myReviews,
                    ),
                    profileListItem(
                      imagePath: AppImages.payIcon,
                      onTap: () {},
                      title: StringConsts.paymentMethods,
                    ),
                    profileListItem(
                      imagePath: AppImages.supportIcon,
                      onTap: () {
                        Get.dialog(
                          ImageDialog(
                            title: "",
                            imagePath: AppImages.supportImage,
                            buttonText: StringConsts.reqCallBack,
                            onConfirm: () {
                              Get.back();
                            },
                            themeColor: AppColor.buttonOrange,
                          ),
                        );
                      },
                      title: StringConsts.helpSupport,
                    ),
                    profileListItem(
                      imagePath: AppImages.deleteAccountIcon,
                      onTap: () {
                        Get.dialog(
                          ImageDialog(
                            title: StringConsts.reallyWantDeleteAccount,
                            imagePath: AppImages.deleteAccountImage,
                            buttonText: StringConsts.confirm,
                            onConfirm: () {
                              Get.back();
                            },
                            outlineText: StringConsts.cancel,
                            themeColor: AppColor.buttonOrange,
                          ),
                        );
                      },
                      title: StringConsts.delAccount,
                    ),
                    profileListItem(
                      imagePath: AppImages.logoutIcon,
                      onTap: () {
                        Get.dialog(
                          ImageDialog(
                            title: StringConsts.reallyWantLogout,
                            imagePath: AppImages.logoutImage,
                            buttonText: StringConsts.confirm,
                            onConfirm: () {
                              Get.back();
                              settingsController.logout((){
                                Get.offAllNamed(Routes.loginScreen);
                              });
                            },
                            outlineText: StringConsts.cancel,
                            themeColor: AppColor.buttonOrange,
                          ),
                        );
                      },
                      title: StringConsts.logout,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget profileListItem({
  required String imagePath,
  required String title,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.dividerColor)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          const SizedBox(width: 18),
          Expanded(
            child: Text(title, style: AppTextStyles.get16RegularTextStyle()),
          ),
        ],
      ),
    ),
  );
}
