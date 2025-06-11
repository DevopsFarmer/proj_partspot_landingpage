import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class WhatsInclinedCard extends StatelessWidget {
  const WhatsInclinedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.whiteColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(StringConsts.whatsIncluded,style: AppTextStyles.get20BoldTextStyle()),
          const SizedBox(height: 10),
          _buildAboutItem(text: "VIP entrance"),
          _buildAboutItem(text: "Premium Valet parking"),
          _buildAboutItem(text: "Immersive light show"),
          _buildAboutItem(text: "Exclusive bar counter"),
          _buildAboutItem(text: "Midnight Canapés"),
        ],
      ),
    );
  }

  _buildAboutItem({required String? text}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CustomSvgPicture(iconPath: AppIcons.greenCheckIcon,width: 21,height: 21),
          const SizedBox(width: 14),
          Expanded(child: Text(text ?? '',style: AppTextStyles.get14RegularTextStyle(color: AppColor.darkGreyTextColor),)),
        ],
      ),
    );
  }
}
