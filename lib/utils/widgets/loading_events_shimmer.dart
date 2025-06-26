import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:shimmer/shimmer.dart';

class EventShimmerItem extends StatelessWidget {
  const EventShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 144,
          width: double.infinity,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(color: Colors.grey.shade300),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 16,
                            width: 100,
                            color: AppColor.whiteColor,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            height: 12,
                            width: 80,
                            color: AppColor.whiteColor,
                          ),
                        ],
                      ),
                      Container(
                        height: 12,
                        width: 60,
                        color: AppColor.whiteColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
