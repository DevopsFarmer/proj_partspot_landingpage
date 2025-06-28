import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class AboutEventCard extends StatelessWidget {
  final String? location;
  final DateTime? date;
  final int? guest;
  final List<String?>? tags;
  const AboutEventCard({super.key,this.location,this.date,this.guest,this.tags});

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
          Text(StringConsts.aboutEvent,style: AppTextStyles.get20BoldTextStyle()),
          const SizedBox(height: 10),
          _buildAboutItem(text: location ?? '',iconPath: AppIcons.locationIcon),
          if(date != null)
            _buildAboutItem(text: "${DateFormat("d MMMM y, h:mm a").format(date!).toLowerCase()} onwards",iconPath: AppIcons.eventCalendarIcon),
          _buildAboutItem(text: "Up to $guest guests",iconPath: AppIcons.guestIcon),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: List.generate(tags?.length ?? 0, (index){
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.violet.withOpacity(0.2)
                ),
                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                child: Text(tags?[index] ?? '',style: AppTextStyles.get12MediumTextStyle(color: AppColor.violet),),
              );
            }),
          )
        ],
      ),
    );
  }

  _buildAboutItem({String? text,String? iconPath}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CustomSvgPicture(iconPath: iconPath,width: 21,height: 21),
          const SizedBox(width: 14),
          Expanded(child: Text(text ?? '',style: AppTextStyles.get14RegularTextStyle(color: AppColor.darkGreyTextColor),)),
        ],
      ),
    );
  }
}
