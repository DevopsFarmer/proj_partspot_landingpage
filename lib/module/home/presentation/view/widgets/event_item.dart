import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/utility.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';
import 'package:partyspot/utils/widgets/custom_network_image.dart';

class EventItem extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final String? desc;
  final String? image;
  final Widget? suffixWidget;
  const EventItem({super.key,this.onTap,required this.title,required this.desc,this.image,this.suffixWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 144,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Utility.isNetworkImage(image)
                    ? CustomNetworkImage(
                  boxFit: BoxFit.fitWidth,
                  imageUrl: image,
                ) : CustomImageAsset(
                  fit: BoxFit.fitWidth,
                  image: image,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title ?? '',
                            style: AppTextStyles.get16BoldTextStyle(
                              color: AppColor.whiteColor,
                            ),
                          ),
                          Text(
                            desc ?? '',
                            style: AppTextStyles.get12MediumTextStyle(
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: suffixWidget ??  Text(
                          "See more >",
                          style: AppTextStyles.get12MediumTextStyle(
                            color: AppColor.whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
