import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class MyPlanHeader extends StatelessWidget {
  final VoidCallback onSeeMoreTap;
  final String title;
  final Color backgroundColor;
  final Color textColor;

  const MyPlanHeader({
    Key? key,
    required this.onSeeMoreTap,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.get20BoldTextStyle(
                color: AppColor.whiteColor,
              ),
            ),
          ),
          InkWell(
            onTap: onSeeMoreTap,
            child: Text(
              "See More >",
              style: AppTextStyles.get12MediumTextStyle(
                color: AppColor.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
