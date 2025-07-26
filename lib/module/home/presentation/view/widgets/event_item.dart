import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/widgets/custom_network_image.dart';

class EventItem extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final String? desc;
  final String? image;
  const EventItem({super.key,this.onTap,required this.title,required this.desc,this.image});

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
                CustomNetworkImage(
                  boxFit: BoxFit.fitWidth,
                  imageUrl: image,
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
                        child: Text(
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
