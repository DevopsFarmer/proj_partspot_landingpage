import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class DocumentRowCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final Color backgroundColor;

  const DocumentRowCard({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Center(child: Image.asset(iconPath)),
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          flex: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      title,
                      style: AppTextStyles.get14SemiBoldTextStyle(
                        color: AppColor.blackColor,
                      ),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: AppTextStyles.get8MediumTextStyle(
                      color: AppColor.color636363,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
