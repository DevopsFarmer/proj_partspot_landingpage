import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class EventBookedSuccessDialog extends StatelessWidget {
  final void Function()? onDone;
  const EventBookedSuccessDialog({super.key,this.onDone});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomImageAsset(
              image: AppIcons.popperIcon,
            ),
            const SizedBox(height: 20),
            Text(StringConsts.allSetText,textAlign: TextAlign.center,style: AppTextStyles.get16BoldTextStyle(color: AppColor.orangeColor)),
            const SizedBox(height: 20),
            AppButton(StringConsts.done, onPressed: onDone ?? (){
              Get.back();
            })
          ],
        ),
      ),
    ));
  }
}
