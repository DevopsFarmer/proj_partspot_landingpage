import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class SettingsInfo extends StatelessWidget {
  final VoidCallback onNotificationTap;

  const SettingsInfo({Key? key, required this.onNotificationTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColor.whiteColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(AppImages.settingsBackground, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConsts.yrProfile,
                  style: AppTextStyles.get24BoldTextStyle(
                    color: AppColor.whiteColor,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: onNotificationTap,
                  child: CustomImageAsset(
                    image: AppIcons.exploreBell,
                    height: 35,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
