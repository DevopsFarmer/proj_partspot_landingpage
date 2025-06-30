import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:percentify/components/RoundedCircularPercentify.dart';
import 'package:shimmer/shimmer.dart';

class ProfileImageStatus extends StatelessWidget {
  final double percentage;
  final String imageUrl;

  const ProfileImageStatus({
    super.key,
    required this.percentage,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 130,
            height: 130,
            child: RoundedCircularPercentify(
              percentage,
              backgroundColor: AppColor.whiteColor,
              valueColor: AppColor.buttonOrange,
              strokeWidth: 8,
              valueStrokeWidth: 8,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: 100,
                          height: 100,
                          color: AppColor.whiteColor,
                        ),
                      ),
                  errorWidget:
                      (context, url, error) => Image.asset(
                        AppImages.supportImage,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
              child: Text(
                "$percentage%",
                style: AppTextStyles.get14BoldTextStyle(
                  color: AppColor.buttonOrange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
