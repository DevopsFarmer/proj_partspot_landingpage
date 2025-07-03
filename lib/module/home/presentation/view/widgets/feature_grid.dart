import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/home/data/models/events_meta.dart';
import 'package:partyspot/routes/routes_const.dart' show Routes, RoutesArgument;
import 'package:partyspot/utils/classes/app_text_styles.dart' show AppTextStyles;
import 'package:partyspot/utils/constants/app_enums.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart' show StringConsts;
import 'package:partyspot/utils/widgets/custom_network_image.dart';

class FeatureGrid extends StatelessWidget {
  final EventsMetaDataResponse? eventData;
  const FeatureGrid({super.key,required this.eventData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(StringConsts.featured,style: AppTextStyles.get20MediumTextStyle(),),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 16,
              children: List.generate(eventData?.eventType?.length ?? 0, (index){
                return _featureItem(imagePath: eventData?.eventType?[index].image,title: eventData?.eventType?[index].name,onTap: (){
                  if(eventData?.eventType?[index].name?.toLowerCase().replaceAll(" ", "") == EventTypes.wedding.name.toLowerCase()) {
                    Get.toNamed(Routes.planAWeddingOverviewScreen,arguments: {
                      RoutesArgument.subTypes: eventData?.eventSubType?.where((e)=>e.parent == eventData?.eventType?[index].id).toList(),
                      RoutesArgument.venueTypes: eventData?.venues,
                      RoutesArgument.foodPreferences: eventData?.foodPrefs,
                      RoutesArgument.eventType: eventData?.eventType?[index],
                    });
                  }else if(eventData?.eventType?[index].name?.toLowerCase().replaceAll(" ", "") == EventTypes.selfHosted.name.toLowerCase()){
                    Get.toNamed(Routes.selfHostedOverviewScreen,arguments: {
                      RoutesArgument.subTypes: eventData?.eventSubType?.where((e)=>e.parent == eventData?.eventType?[index].id).toList(),
                      RoutesArgument.venueTypes: eventData?.venues,
                      RoutesArgument.foodPreferences: eventData?.foodPrefs,
                      RoutesArgument.eventType: eventData?.eventType?[index],
                    });
                  }else if(eventData?.eventType?[index].name?.toLowerCase().replaceAll(" ", "") == EventTypes.curatedParties.name.toLowerCase()){
                    Get.toNamed(Routes.curatedEventsListScreen,arguments: {RoutesArgument.eventId: eventData?.eventType?[index].id});
                  }else if(eventData?.eventType?[index].name?.toLowerCase().replaceAll(" ", "") == EventTypes.multipleHost.name.toLowerCase()){

                  }
                });
              }),
            ),
          )
        ],
      ),
    );
  }
  
  _featureItem({String? imagePath, String? title,Function()? onTap}){
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            width: AppSizes.width * 0.5 - 24,
            height: AppSizes.width * 0.5 - 24,
            child: Stack(
              alignment: Alignment.bottomLeft,
              fit: StackFit.expand,
              children: [
                CustomNetworkImage(
                  imageUrl: imagePath,
                  boxFit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title ?? '', style: AppTextStyles.get16BoldTextStyle(color: AppColor.whiteColor)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Explore', style: AppTextStyles.get12MediumTextStyle(color: AppColor.whiteColor)),
                          const SizedBox(width: 4),
                          Icon(Icons.arrow_forward_ios_rounded,color: AppColor.whiteColor,size: 12,)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
