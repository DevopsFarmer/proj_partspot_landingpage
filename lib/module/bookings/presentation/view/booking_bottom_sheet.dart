import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/bookings/presentation/view/widgets/doc_row_card.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';

class BookingBottomSheet extends StatelessWidget {
  final VoidCallback onDonePressed;

  const BookingBottomSheet({super.key, required this.onDonePressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColor.blackColor,
                    size: 30,
                  ),
                ),
                Text(
                  StringConsts.myWedPlan,
                  style: AppTextStyles.get24SemiBoldTextStyle(
                    color: AppColor.blackColor,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Image.asset(
                AppImages.bookingImg,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),

            Column(
              children: [
                DocumentRowCard(
                  iconPath: AppImages.planIcon,
                  title: StringConsts.weddingPlaning,
                  subtitle: StringConsts.docsFromUs,
                  backgroundColor: AppColor.lightPurple,
                ),
                const SizedBox(height: 10),
                DocumentRowCard(
                  iconPath: AppImages.docIcon,
                  title: StringConsts.myDocuments,
                  subtitle: StringConsts.docUGive,
                  backgroundColor: AppColor.lightPink,
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppColor.colorEFEFEF,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Image.asset(AppImages.uploadIcon),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${StringConsts.choose} ',
                            style: AppTextStyles.get14MediumTextStyle(
                              color: AppColor.color2196F3,
                            ),
                          ),
                          TextSpan(
                            text: StringConsts.fileToUpload,
                            style: AppTextStyles.get14MediumTextStyle(
                              color: AppColor.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      StringConsts.selectJpgPng,
                      style: AppTextStyles.get12MediumTextStyle(
                        color: AppColor.colorB9B9B9,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            AppButton(
              StringConsts.done,
              onPressed: onDonePressed,
              height: 50,
              padding: const EdgeInsets.symmetric(vertical: 12),
              textStyle: AppTextStyles.get14BoldTextStyle(
                color: AppColor.whiteColor,
              ),
              backgroundColor: AppColor.orangeColor,
            ),
          ],
        ),
      ),
    );
  }
}
