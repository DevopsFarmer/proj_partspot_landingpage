import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:partyspot/module/explore/presentation/controller/explore_controller.dart';
import 'package:partyspot/module/explore/presentation/view/widgets/explore_appbar.dart';
import 'package:partyspot/module/explore/presentation/view/widgets/filter_event_dialog.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/home/presentation/view/widgets/event_item.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart'
    show AppTextStyles;
import 'package:partyspot/utils/constants/string_consts.dart' show StringConsts;
import 'package:partyspot/utils/widgets/loading_events_shimmer.dart';
import 'package:partyspot/utils/widgets/no_data_found_widget.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  final TextEditingController textController = TextEditingController();
  final ExploreController controller = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColor.whiteColor,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: CustomExploreAppBar(
          textController: textController,
          onFilterTap: () => _showFilterDialog(context),
          onNotificationTap: () {
            print("Notification icon tapped");
          },
          onSearchChanged: (value) {
            print("Search text: $value");
          },
        ),

        body: GetBuilder(
          init: ExploreController(),
          builder: (controller){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    StringConsts.popularEvents,
                    style: AppTextStyles.get20MediumTextStyle(),
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
                      if(controller.isBusy) {
                        return ListView.builder(
                          controller: controller.scrollController,
                          itemCount: 5,
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (context, index) => const EventShimmerItem(),
                        );
                      }else if(controller.curatedParties.isEmpty){
                        return NoDataFoundWidget();
                      }else{
                        return ListView.builder(
                          itemCount: controller.curatedParties.length,
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (context,index){
                            return EventItem(
                              title: controller.curatedParties[index]?.title ?? '',
                              desc: controller.curatedParties[index]?.location ?? '',
                              onTap: (){
                                Get.toNamed(Routes.curatedEventInfoScreen,arguments: {RoutesArgument.curatedPartyInfo: controller.curatedParties[index]});
                              },
                              image: controller.curatedParties[index]?.image,
                            );
                          },
                        );
                      }
                    }),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return FilterDialogWidget();
      },
    );
  }
}
