import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class NoDataFoundWidget extends StatelessWidget {
  final String? message;
  final IconData icon;
  final double iconSize;
  final TextStyle? textStyle;

  const NoDataFoundWidget({
    super.key,
    this.message,
    this.icon = Icons.search_off,
    this.iconSize = 80.0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: iconSize,
            color: AppColor.greyColor,
          ),
          const SizedBox(height: 16),
          Text(
            message ?? StringConsts.noDataFound,
            style: textStyle ??
                AppTextStyles.get18RegularTextStyle(color: AppColor.greyColor),
          ),
        ],
      ),
    );
  }
}
