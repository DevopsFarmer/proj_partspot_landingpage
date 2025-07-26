import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/curated_events_list/data/models/curated_event_list_response.dart';
import 'package:partyspot/module/event_info/controller/curated_event_info_controller.dart';
import 'package:partyspot/module/event_info/presentation/widgets/about_event_card.dart';
import 'package:partyspot/module/event_info/presentation/widgets/book_your_ticket_card.dart';
import 'package:partyspot/module/event_info/presentation/widgets/entry_requirement_card.dart';
import 'package:partyspot/module/event_info/presentation/widgets/hosted_and_partner_by.dart';
import 'package:partyspot/module/event_info/presentation/widgets/whats_inclined_card.dart';
import 'package:partyspot/module/app_entry/data/models/events_meta.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/app_drop_down.dart';
import 'package:partyspot/utils/widgets/back_button.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_network_image.dart';
import 'package:partyspot/utils/widgets/loader.dart';

import '../../plan_a_wedding/data/models/plan_event_response.dart';

class EventInfoScreen extends StatelessWidget {
  final Datum? curatedEventList;
  const EventInfoScreen({super.key,this.curatedEventList});

  @override
  Widget build(BuildContext context) {
    final CuratedEventInfoController curatedEventInfoController = Get.find<CuratedEventInfoController>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgVioletColor,
        body: GetBuilder<CuratedEventInfoController>(
          init: curatedEventInfoController,
          builder: (controller) {
            if(controller.isBusy){
              return Center(child: CircularLoader());
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
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
                              height: 375.spH,
                              child: CustomNetworkImage(
                                boxFit: BoxFit.cover,
                                imageUrl: curatedEventList?.image,
                              ),
                            ),
                            Positioned(
                              top: 16,
                              left: 16,
                              child: AppBackButton(),
                            ),
                            Positioned(
                              bottom: 22,
                              left: 24,
                              right: 24,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(curatedEventList?.name?.name ?? '',style: AppTextStyles.get32BoldTextStyle(color: AppColor.whiteColor)),
                                        Text(curatedEventList?.location ?? '',style: AppTextStyles.get14RegularTextStyle(color: AppColor.whiteColor)),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: AppColor.disableButtonOrange,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                                    child: Text('₹${curatedEventList?.price}',style: AppTextStyles.get30BoldTextStyle(color: AppColor.whiteColor)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  AboutEventCard(
                    date: curatedEventList?.startDate,
                    guest: curatedEventList?.numberOfGuests,
                    location: curatedEventList?.location,
                    tags: curatedEventList?.tags,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.whiteColor,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConsts.selectTheme,style: AppTextStyles.get20BoldTextStyle()),
                        const SizedBox(height: 10),
                        AppDropDown<PartyTheme?>(
                          items: controller.eventMetaData?.theme?.map((e)=>DropdownMenuItem<PartyTheme?>(child: Text(e.name ?? ''),value: e)).toList() ?? [],
                          value: null,
                          onChanged: (val){
                            controller.partyTheme = val;
                          },
                          hint: StringConsts.selectTheme,
                          color: AppColor.whiteColor,
                          borderSide: BorderSide(
                            color: AppColor.greyColor,
                            width: 0.5
                          ),
                        ),
                      ],
                    ),
                  ),
                  WhatsInclinedCard(
                    whatsIncluded: curatedEventList?.whatsIncluded,
                  ),
                  EntryRequirementCard(
                    entryRequirements: curatedEventList?.entryRequirements,
                  ),
                  HostedAndPartnerBy(
                    hostedBy: curatedEventList?.hostedBy,
                    partnerBy: curatedEventList?.partneredBy,
                  ),
                  BookYourTicketCard(
                    price: curatedEventList?.price,
                    onCounterChanged: (val){
                      curatedEventInfoController.noOfGuest = val ?? 1;
                    },
                  ),
                  const SizedBox(height: 6),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: AppButton(StringConsts.bookNow, onPressed: (){
                      curatedEventInfoController.bookEvent(
                        eventId: curatedEventList?.id,
                        onSuccess: (agent)async{
                          Get.until((route) => route.settings.name == Routes.appEntryScreen);
                          Get.toNamed(Routes.representativeScreen,arguments: {RoutesArgument.assignedAgent: AssignedAgent.fromJson(agent?.toJson() ?? {})});
                        }
                      );
                    },backgroundColor: AppColor.violet),
                  ),
                  const SizedBox(height: 24,),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
