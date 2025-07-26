import 'package:easy_localization/easy_localization.dart' show DateFormat;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/app_entry/data/models/events_meta.dart';
import 'package:partyspot/module/plan_a_wedding/presentation/controller/plan_a_event_controller.dart';
import 'package:partyspot/module/plan_your_event/presentation/widgets/enter_custom_venue_dialog.dart';
import 'package:partyspot/module/plan_your_event/presentation/widgets/enter_guest_dialog.dart';
import 'package:partyspot/module/self_hosted_party/presentation/controller/part_selection_controller.dart';
import 'package:partyspot/module/self_hosted_party/presentation/widgets/selection_item.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/app_text_field.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';
import 'package:path/path.dart' as p;

class PlanYourEventScreen extends StatelessWidget {
  final String? title;
  PlanYourEventScreen({super.key, this.title});

  final PlanAEventController planAEventController = Get.find<PlanAEventController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? '',style: AppTextStyles.get18MediumTextStyle()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
          child: Column(
            children: [
              GestureDetector(
                onTap: ()async {
                  final date = await _selectDOB(context);
                  if(date != null){
                    planAEventController.selectedStartDate = date;
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.orangeColor,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx((){
                            return Row(
                              children: [
                            Text(planAEventController.selectedStartDate != null
                                ? DateFormat('dd/MM/yyyy').format(planAEventController.selectedStartDate ?? DateTime.now())
                                : StringConsts.chooseStartDate,style: AppTextStyles.get16MediumTextStyle()),
                                  Visibility(
                                      visible: planAEventController.selectedStartDate == null,
                                      child: Text("*",style: AppTextStyles.get16MediumTextStyle(color: AppColor.redColor))),
                              ],
                            );

                          }),
                        ],
                      ),
                      CustomSvgPicture(iconPath: AppIcons.calendarIcon)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22),
              GestureDetector(
                onTap: ()async {
                  final date = await _selectDOB(context);
                  if(date != null){
                    planAEventController.selectedEndDate = date;
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColor.orangeColor,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx((){
                            return Row(
                              children: [
                            Text(planAEventController.selectedEndDate != null
                                ? DateFormat('dd/MM/yyyy').format(planAEventController.selectedEndDate ?? DateTime.now())
                                : StringConsts.chooseEndDate,style: AppTextStyles.get16MediumTextStyle()),
                              ],
                            );

                          }),
                        ],
                      ),
                      CustomSvgPicture(iconPath: AppIcons.calendarIcon)
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.orangeColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConsts.numberOfGuests,style: AppTextStyles.get16MediumTextStyle()),
                        Text("*",style: AppTextStyles.get16MediumTextStyle(color: AppColor.redColor)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx((){
                            return Text('${planAEventController.noOfGuest} Guests',style: AppTextStyles.get16RegularTextStyle(color: AppColor.darkGreyTextColor));
                          }),
                          GestureDetector(
                            onTap: ()async{
                              final res = await showCustomGuestDialog(context);
                              if(res != null){
                                planAEventController.noOfGuest = res;
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppColor.offWhiteColor,
                                borderRadius: BorderRadius.circular(2),
                                border: Border.all(
                                  color: AppColor.disabledColor
                                )
                              ),
                              child: Text(StringConsts.custom,style: AppTextStyles.get12RegularTextStyle(),),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.orangeColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConsts.venueType,style: AppTextStyles.get16MediumTextStyle()),
                        Text("*",style: AppTextStyles.get16MediumTextStyle(color: AppColor.redColor)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Visibility(
                      visible: planAEventController.venueTypes?.isNotEmpty ?? false,
                      child: GetBuilder<PartyTypeSelectionController<Venue?>>(
                          init: PartyTypeSelectionController<Venue?>(isMultiSelect: true),
                          tag: 'venue_type',
                          builder: (controller) {
                            return Obx(() => Wrap(
                              spacing: 5.spW,
                              runSpacing: 12,
                              children: List.generate(planAEventController.venueTypes?.length ?? 0, (index) {
                                final item = planAEventController.venueTypes?[index];
                                final isSelected = controller.isSelected(item);
                                return SelectionItem(
                                  text: item?.name ?? '',
                                  borderRadius: 4,
                                  isSelected: isSelected,
                                  onTap: ()async{
                                    controller.toggleSelection(item);
                                    planAEventController.selectedVenueTypes = controller.selectedItems;
                                  },
                                  borderWidth: 1,
                                  textStyle: AppTextStyles.get14RegularTextStyle(
                                    color: isSelected ? AppColor.orangeColor : AppColor.disabledColor,
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                                );
                              }),
                            ));
                          }
                      ),
                    )

                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.orangeColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(StringConsts.foodPreferences,style: AppTextStyles.get16MediumTextStyle()),
                        Text("*",style: AppTextStyles.get16MediumTextStyle(color: AppColor.redColor)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    GetBuilder<PartyTypeSelectionController<FoodPref?>>(
                        init: PartyTypeSelectionController<FoodPref?>(isMultiSelect: true),
                        tag: 'food_preferences',
                        builder: (controller) {
                          return Obx(() => Wrap(
                            spacing: 5.spW,
                            runSpacing: 12,
                            children: List.generate(planAEventController.foodPreferences?.length ?? 0, (index) {
                              final item = planAEventController.foodPreferences?[index];
                              final isSelected = controller.isSelected(item);
                              return SelectionItem(
                                text: item?.name ?? '',
                                borderRadius: 4,
                                isSelected: isSelected,
                                onTap: () {
                                  controller.toggleSelection(item);
                                  planAEventController.selectedFoodPreferences = controller.selectedItems;
                                },
                                borderWidth: 1,
                                textStyle: AppTextStyles.get14RegularTextStyle(
                                  color: isSelected ? AppColor.orangeColor : AppColor.disabledColor,
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                              );
                            }),
                          ));
                        }
                    )
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.orangeColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringConsts.notes,style: AppTextStyles.get16MediumTextStyle()),
                    const SizedBox(height: 30),
                    AppTextField(
                      maxLines: 3,
                      backgroundColor: AppColor.whiteColor,
                      hint: StringConsts.enterNotesHere,
                      onChanged: (val){
                        planAEventController.note = val;
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 22),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.orangeColor,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringConsts.specialRequirements,style: AppTextStyles.get16MediumTextStyle()),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx((){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SelectionItem(
                                  borderWidth: 1,
                                  icon: AppIcons.uploadIcon,
                                  textStyle: AppTextStyles.get14RegularTextStyle(
                                    color:  AppColor.disabledColor,
                                  ),
                                  borderRadius: 4,
                                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
                                  text: StringConsts.uploadPDF,
                                  isSelected: planAEventController.file != null,
                                  onTap: (){
                                    planAEventController.pickOnlyPdfFile();
                                  }
                              ),
                              Visibility(
                                  visible: planAEventController.file != null,
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(p.basename(planAEventController.file?.path ?? ''),overflow: TextOverflow.ellipsis,style: AppTextStyles.get14RegularTextStyle(),),
                              ))
                            ],
                          );
                        })
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 22),
              AppButton(StringConsts.submit, onPressed: (){
                planAEventController.submit(
                  (bookingData) {
                    Get.until((route) => route.settings.name == Routes.appEntryScreen);
                    Get.toNamed(Routes.representativeScreen,arguments: {RoutesArgument.assignedAgent: bookingData?.assignedAgent});
                  },
                );
              },backgroundColor: AppColor.violet,),
            ],
          ),
        ),
      ),
    );
  }

  Future<DateTime?> _selectDOB(BuildContext context) async {

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(3000),
      helpText: 'Select your date of birth',
    );

    if (picked != null) {
      return picked;
    }else{
      return null;
    }
  }

  Future<int?> showCustomGuestDialog(BuildContext context) {
    return showDialog<int>(
      context: context,
      builder: (context) {
        return EnterGuestDialog(
          initialValue: planAEventController.noOfGuest.toString(),
        );
      },
    );
  }

  Future<String?> showCustomVenueDialog(BuildContext context,{String? initialValue}) {
    return showDialog<String?>(
      context: context,
      builder: (context) {
        return EnterCustomVenueDialog(initialValue: initialValue,);
      },
    );
  }
}
