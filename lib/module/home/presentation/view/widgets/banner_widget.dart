import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/home/presentation/controller/banner_controller.dart';
import 'package:partyspot/utils/widgets/custom_network_image.dart';

import 'package:shimmer/shimmer.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<BannerController>(
      init: BannerController(),
      builder: (controller) {
        if (controller.isBusy) {
          return _buildLoader(context);
        }

        return Visibility(
         visible: controller.bannerData?.data?.isNotEmpty ?? false,
          child: CarouselSlider.builder(
            itemCount: controller.bannerData?.data?.length ?? 0,
            options: CarouselOptions(
              autoPlay: true,
              viewportFraction: 1,
              aspectRatio: 16 / 6,
            ),
            itemBuilder: (context, index, realIndex) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CustomNetworkImage(
                    boxFit: BoxFit.cover,
                    imageUrl: controller.bannerData?.data?[index].imageUrl,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  _buildLoader(BuildContext context){
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: MediaQuery.of(context).size.width * (6 / 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
