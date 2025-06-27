import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/widgets/text_view.dart';


void showSnackBar({required String? text, Color? color, Color? textColor, bool? isError,Duration? duration}) {


  if(text == null || text.isEmpty){
    return;
  }
  Get.rawSnackbar(
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color ?? (isError == true ? AppColor.greyColor : AppColor.primaryColor),
    borderRadius: 12,

    margin: const EdgeInsets.all(16),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    duration: duration ?? const Duration(milliseconds: 1500),
    isDismissible: true,
    messageText: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.spW),
          child: Icon(
            isError == true ? Icons.error_outline_rounded : Icons.check_circle,
            color: AppColor.whiteColor,
          ),
        ),
        Expanded(
          child: TextView(
            text,
            style: AppTextStyles.get16RegularTextStyle(
              color: textColor ?? AppColor.whiteColor,
            ),
          ),
        ),
      ],
    ),
  );
}
