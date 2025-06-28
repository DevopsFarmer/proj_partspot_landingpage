// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:partyspot/utils/constants/app_size.dart';
//
// import '../constants/color_consts.dart';
//
// void showProgressLoader() {
//   if (!(Get.isDialogOpen ?? true)) {
//
//   }
//   Get.dialog(
//     Container(
//       alignment: Alignment.center,
//       padding: const EdgeInsets.all(20),
//       height: 120.0,
//       decoration: BoxDecoration(
//         color: Colors.transparent,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       constraints: BoxConstraints(
//         maxHeight: 200.0,
//         maxWidth: AppSizes.getDynamicWidth(120),
//       ),
//       child: const SizedBox(
//         height: 40.0,
//         width: 40.0,
//         child: CircularProgressIndicator.adaptive(
//           valueColor: AlwaysStoppedAnimation<Color>(AppColor.whiteColor),
//           backgroundColor: AppColor.primaryColor,
//         ),
//       ),
//     ),
//     barrierDismissible: false,
//   );
// }
// void cancelDialog(){
//   Get.back();
// }
