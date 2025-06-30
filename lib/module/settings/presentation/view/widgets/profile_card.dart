import 'package:flutter/material.dart';
import 'package:partyspot/module/settings/presentation/view/widgets/settings_current_plan_row.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
// Ensure this path is correct

class ProfileCard extends StatelessWidget {
  final String userName;
  final String iconPath;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onUpgradeTap;

  const ProfileCard({
    super.key,
    required this.userName,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onUpgradeTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.fromLTRB(10, 85, 10, 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.whiteColor.withOpacity(0.74),
              AppColor.colorE1E1E1.withOpacity(0.33),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColor.blackColor, width: 0.2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              userName,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: AppTextStyles.get20BoldTextStyle(
                color: AppColor.whiteColor,
              ),
            ),
            CurrentPlanRow(
              iconPath: iconPath,
              title: title,
              subtitle: subtitle,
              buttonText: buttonText,
              onUpgradeTap: onUpgradeTap,
            ),
          ],
        ),
      ),
    );
  }
}
