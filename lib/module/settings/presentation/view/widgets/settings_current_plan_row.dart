import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class CurrentPlanRow extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onUpgradeTap;

  const CurrentPlanRow({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onUpgradeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        border: Border.all(color: AppColor.borderB0B0B0),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(100),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Dynamic icon
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: const BoxDecoration(
              color: AppColor.buttonOrange,
              shape: BoxShape.circle,
            ),
            child: CustomImageAsset(image: iconPath),
          ),

          // Dynamic title and subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: AppTextStyles.get18SemiBoldTextStyle()),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTextStyles.get10SemiBoldTextStyle(
                  color: AppColor.colorA1A1A1,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Dynamic upgrade button
          GestureDetector(
            onTap: onUpgradeTap,
            child: Container(
              height: 68,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: const BoxDecoration(
                color: AppColor.buttonOrange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: AppTextStyles.get14SemiBoldTextStyle(
                    color: AppColor.whiteColor,
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
