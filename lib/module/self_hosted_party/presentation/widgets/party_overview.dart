import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class PartyOverview extends StatelessWidget {
  final String? title;
  final String? desc;
  final String? image;
  final Function()? onNext;
  final String? buttonText;
  const PartyOverview({super.key,this.title,this.desc,this.image,this.onNext,this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CustomImageAsset(image: image,fit: BoxFit.cover,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColor.blackColor.withAlpha((0.6 * 255).toInt()),
                      AppColor.blackColor.withAlpha((0.5 * 255).toInt()),
                      AppColor.blackColor.withAlpha((0.3 * 255).toInt()),
                      AppColor.blackColor.withAlpha((0.2 * 255).toInt()),
                      AppColor.blackColor.withAlpha((0.1 * 255).toInt()),
                      AppColor.transparent,
                      AppColor.transparent,
                      AppColor.transparent,
                      AppColor.transparent,
                      AppColor.transparent,
                    ]
                  )
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.spW,vertical: 8.spH),
                  child: Text(title?.toUpperCase() ?? '',style: AppTextStyles.get24BoldTextStyle(color: AppColor.whiteColor,letterSpacing: 7),textAlign: TextAlign.center,),
                ),
              ),
              CustomSvgPicture(
                iconPath: AppIcons.playIcon,
              )
            ],
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40)
              )
            ),
            padding: EdgeInsets.symmetric(horizontal: 30.spW,vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(desc ?? '',style: AppTextStyles.get24MediumTextStyle(color: AppColor.textPurple,letterSpacing: 1.2),textAlign: TextAlign.center),
                AppButton(buttonText ?? StringConsts.getStarted, onPressed: onNext),
              ],
            ),
          ),
        )
      ],
    );
  }
}
