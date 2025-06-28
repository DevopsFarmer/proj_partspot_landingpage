import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/widgets/counter_widget/app_counter_controller.dart';

class AppCounter extends StatelessWidget {
  final AppCounterController controller;
  final ValueChanged<num?> onChanged;
  final num? maxNum;

  const AppCounter({
    super.key,
    required this.controller,
    required this.onChanged,
    this.maxNum
  });

  @override
  Widget build(BuildContext context) {
    controller.counterRx.listen((value) => onChanged(value));

    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: AppColor.disableButtonOrange,
        border: Border.all(color: AppColor.borderGreyColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Obx(() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: controller.decrement,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.whiteColor
              ),
              child: Icon(
                Icons.remove,
                size: 16,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Text(
            '${controller.counter}',
            style: AppTextStyles.get16SemiBoldTextStyle(),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: GestureDetector(
              onTap: controller.increment,
              child: Icon(
                size: 16,
                Icons.add,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
