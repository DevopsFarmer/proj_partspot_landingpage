import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/bookings/presentation/controller/booking_controller.dart';
import 'package:partyspot/module/home/presentation/view/widgets/event_item.dart';
import 'package:partyspot/module/plan_a_wedding/data/models/plan_event_response.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/loading_events_shimmer.dart';

class BookingScreen extends StatelessWidget {
   BookingScreen({super.key});

  final BookingController bookingController = Get.find<BookingController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          StringConsts.myBooking,
          style: AppTextStyles.get24SemiBoldTextStyle(
            color: AppColor.blackColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Obx((){
          if(bookingController.isBusy) {
            return ListView.builder(
              itemCount: 5,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => const EventShimmerItem(),
            );
          }else{
            return ListView.builder(
              itemCount: bookingController.bookingList.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context,index){
                return EventItem(
                  title: bookingController.bookingList[index]?.event?.name?.name ?? '',
                  desc: bookingController.bookingList[index]?.event?.location ?? '',
                  onTap: (){
                    Get.toNamed(Routes.representativeScreen,arguments: {RoutesArgument.assignedAgent: AssignedAgent.fromJson(bookingController.bookingList[index]?.agent?.toJson() ?? {})});
                    },
                  image: bookingController.bookingList[index]?.event?.name?.name == 'wedding' ? AppImages.planAWeddingFeatureImage : null,
                );
              },
            );
          }
        })
      ),
    );
  }
}
