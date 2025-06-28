import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/home/presentation/controller/home_controller.dart';
import 'package:partyspot/module/home/presentation/view/widgets/banner_widget.dart';
import 'package:partyspot/module/home/presentation/view/widgets/feature_grid.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';
import 'package:partyspot/utils/widgets/loader.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
          init: homeController,
          builder: (homeController){
            if(homeController.isBusy){
              return Center(child: CircularLoader());
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 7,
                          child: Text(
                            StringConsts.welcomeToPartSpot,
                            style: AppTextStyles.get24BoldTextStyle(),
                          ),
                        ),
                        SizedBox(width: 8),
                        CustomSvgPicture(iconPath: AppIcons.notificationActiveIcon),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  BannerWidget(),
                  FeatureGrid(eventData: homeController.eventMetaData),
                  // PopularEventsList(),
                  // PartySportVipHome(),
                  // SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
