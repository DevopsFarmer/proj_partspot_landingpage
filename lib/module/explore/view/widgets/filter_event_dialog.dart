import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/app_entry/presentation/controller/app_entry_controller.dart';
import 'package:partyspot/module/explore/controller/explore_controller.dart';
import 'package:partyspot/module/app_entry/data/models/events_meta.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/app_drop_down.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/price_range_slider.dart';

class FilterDialogWidget extends StatelessWidget {
  final ExploreController controller = Get.find<ExploreController>();
  final AppEntryController homeController = Get.find<AppEntryController>();

  FilterDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.whiteColor,
      insetPadding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: 24,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  StringConsts.filters,
                  style: AppTextStyles.get24BoldTextStyle(),
                ),
              ),

              _buildSectionTitle(StringConsts.area),
              Obx(
                () => _buildChips(
                  controller.areaList,
                  controller.selectedArea,
                  allowMultiple: true,
                ),
              ),

              const SizedBox(height: 16,),
              PriceRangeSlider(),
              // Obx(
              //   () =>
              //       _buildChips(controller.priceList, controller.selectedPrice),
              // ),

              _buildSectionTitle(StringConsts.selTheme),
              AppDropDown<PartyTheme?>(
                items: homeController.eventMetaData?.theme?.map((e)=>DropdownMenuItem<PartyTheme?>(child: Text(e.name ?? ''),value: e)).toList() ?? [],
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

              const SizedBox(height: 20),

              Obx(
                () => Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: AppColor.colorEDEDED,
                    border: Border.all(color: AppColor.colorD1D1D1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: controller.selectedMonth.value,
                      hint: const Text('All Months-'),
                      style: AppTextStyles.get8MediumTextStyle(
                        color: AppColor.color6F6F6F,
                      ),
                      iconSize: 20,
                      dropdownColor: AppColor.colorEDEDED,
                      items:
                          controller.months.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 1,
                                ),
                                child: Text(
                                  value,
                                  style: AppTextStyles.get8MediumTextStyle(
                                    color: AppColor.color6F6F6F,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                      onChanged: (String? newValue) {
                        controller.setMonth(newValue);
                      },
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: AppButton(
                  StringConsts.apply,
                  onPressed: () {
                    Get.back();
                  },
                  height: 50,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  textStyle: AppTextStyles.get14BoldTextStyle(
                    color: AppColor.whiteColor,
                  ),
                  backgroundColor: AppColor.buttonOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 10),
      child: Text(
        title,
        style: AppTextStyles.get14MediumTextStyle(color: AppColor.color6F6F6F),
      ),
    );
  }

  Widget _buildChips(
    List<String> items,
    RxList<String> selectedItems, {
    bool allowMultiple = false,
  }) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children:
          items.map((item) {
            final isSelected = selectedItems.contains(item);
            return GestureDetector(
              onTap: () {
                controller.toggleSelection(
                  selectedItems,
                  item,
                  allowMultiple: allowMultiple,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color:
                      isSelected
                          ? AppColor.selectedFilterColor
                          : AppColor.colorEDEDED,
                  border:
                      isSelected
                          ? Border.all(
                            color: AppColor.selectedFilterBorder,
                            width: 1,
                          )
                          : null,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  item,
                  style: AppTextStyles.get8RegularTextStyle(
                    color:
                        isSelected ? AppColor.whiteColor : AppColor.color6F6F6F,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }
}
