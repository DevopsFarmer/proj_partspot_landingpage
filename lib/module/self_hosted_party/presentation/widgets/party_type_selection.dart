import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/app_entry/data/models/events_meta.dart';
import 'package:partyspot/module/self_hosted_party/presentation/controller/part_selection_controller.dart';
import 'package:partyspot/module/self_hosted_party/presentation/widgets/selection_item.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/app_size.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class PartyTypeSelection extends StatelessWidget {
  final String? title;
  final String? desc;
  final String? image;
  final List<EventSubType?>? items;
  final bool isMultiSelect;
  final Function(List<String?> selectedItems)? onSelectionDone;

  const PartyTypeSelection({
    super.key,
    this.title,
    this.desc,
    this.image,
    this.items,
    this.isMultiSelect = true,
    this.onSelectionDone,
  });

  @override
  Widget build(BuildContext context) {

    return GetBuilder<PartyTypeSelectionController<String?>>(
      init: PartyTypeSelectionController<String?>(isMultiSelect: isMultiSelect),
      builder: (controller){
        return Column(
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CustomImageAsset(
                    image: image,
                    fit: BoxFit.cover,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                          colors: [
                            AppColor.blackColor.withAlpha((0.6 * 255).toInt()),
                            AppColor.blackColor.withAlpha((0.5 * 255).toInt()),
                            AppColor.blackColor.withAlpha((0.3 * 255).toInt()),
                            AppColor.blackColor.withAlpha((0.2 * 255).toInt()),
                            AppColor.blackColor.withAlpha((0.1 * 255).toInt()),
                            AppColor.transparent,
                            AppColor.transparent,
                            AppColor.transparent,
                            AppColor.transparent,
                            AppColor.transparent,
                          ]
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.spW, vertical: 8.spH),
                      child: Text(
                        title?.toUpperCase() ?? '',
                        style: AppTextStyles.get24BoldTextStyle(
                          color: AppColor.whiteColor,
                          letterSpacing: 7,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  CustomSvgPicture(iconPath: AppIcons.playIcon),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30.spW, vertical: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      desc ?? '',
                      style: AppTextStyles.get18MediumTextStyle(),
                      textAlign: TextAlign.left,
                    ),
                    if(items?.isNotEmpty ?? false)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => Wrap(
                            spacing: 5.spW,
                            runSpacing: 12,
                            children: List.generate(items?.length ?? 0, (index) {
                              final item = items?[index];
                              final isSelected = controller.isSelected(item?.id);
                              return SelectionItem(
                                text: item?.name ?? '',
                                isSelected: isSelected,
                                onTap: () => controller.toggleSelection(item?.id),
                                constraints: BoxConstraints(
                                  minWidth: (AppSizes.width * 0.5) - 35.spW, // Ensure spW is defined
                                ),
                              );
                            }),
                          )),
                          const SizedBox(height: 16),
                          AppButton(
                            StringConsts.next,
                            onPressed: () {
                              if (onSelectionDone != null) {
                                onSelectionDone!(controller.selectedItems);
                              }
                            },
                            backgroundColor: AppColor.violet,
                          )
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}
