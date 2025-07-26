import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/app_entry/data/models/events_meta.dart';
import 'package:partyspot/module/plan_a_wedding/presentation/controller/plan_a_event_controller.dart';
import 'package:partyspot/module/self_hosted_party/presentation/widgets/party_overview.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class PlanAWeddingOverviewScreen extends StatelessWidget {
  final List<EventSubType?>? subTypes;
  final List<Venue?>? venueTypes;
  final List<FoodPref?>? foodPreferences;
  final EventType? eventType;

  const PlanAWeddingOverviewScreen({super.key,required this.subTypes,required this.foodPreferences,required this.venueTypes,required this.eventType});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColor.offWhiteColor,
        body: GetBuilder<PlanAEventController>(
          init: PlanAEventController(
            subTypes: subTypes,
            foodPreferences: foodPreferences,
            venueTypes: venueTypes,
            eventType: eventType
          ),
          builder: (controller){
            return PartyOverview(
              title: StringConsts.planAWedding,
              desc: StringConsts.planAWeddingDesc,
              image: AppImages.planAWeddingOverviewImage,
              onNext: (){
                Get.toNamed(Routes.weddingWaySelectionScreen);
              },
            );
          },
        ),
      ),
    );
  }
}
