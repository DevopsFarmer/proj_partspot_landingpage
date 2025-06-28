import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/curated_events_list/presentation/controller/curated_events_list_controller.dart';
import 'package:partyspot/module/home/presentation/view/widgets/event_item.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart' show AppColor;
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';
import 'package:partyspot/utils/widgets/loading_events_shimmer.dart';

class CuratedEventsListScreen extends StatelessWidget {
  final String? eventId;
  const CuratedEventsListScreen({super.key,this.eventId});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CuratedEventsListController>(
      init: CuratedEventsListController(eventId: eventId),
      builder: (curatedEventsListController){
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColor.offWhiteColor,
            body: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: Stack(
                    // fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        // height: 257.spH,
                        child: CustomImageAsset(
                          fit: BoxFit.fitWidth,
                          image: 'assets/images/jpg/curated_party_dummy_thumnail.jpg',
                        ),
                      ),
                      CustomSvgPicture(
                        iconPath: AppIcons.playIcon,
                      ),
                      Positioned(
                          top: 8,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text('CURATED PARTIES',
                                style: AppTextStyles.get24BoldTextStyle(color: AppColor.whiteColor,letterSpacing: 7)
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Obx((){
                      if(curatedEventsListController.isBusy) {
                        return ListView.builder(
                          itemCount: 5,
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (context, index) => const EventShimmerItem(),
                        );
                      }else{
                        return ListView.builder(
                          itemCount: curatedEventsListController.curatedParties.length,
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (context,index){
                            return EventItem(
                              title: curatedEventsListController.curatedParties[index]?.title ?? '',
                              desc: curatedEventsListController.curatedParties[index]?.location ?? '',
                              onTap: (){
                                Get.toNamed(Routes.curatedEventInfoScreen,arguments: {RoutesArgument.curatedPartyInfo: curatedEventsListController.curatedParties[index]});
                              },
                              image: AppImages.curatedPartyFeatureImage,
                            );
                          },
                        );
                      }
                    }),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
