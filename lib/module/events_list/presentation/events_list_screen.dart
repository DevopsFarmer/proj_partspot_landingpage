import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/home/presentation/view/widgets/event_item.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart' show AppColor;
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class EventsListScreen extends StatelessWidget {
  const EventsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (context,index){
                    return SizedBox(height: 8);
                  },
                  itemBuilder: (context,index){
                    return EventItem(
                      onTap: (){
                        Get.toNamed(Routes.eventInfoScreen);
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
