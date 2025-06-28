// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:partyspot/utils/classes/app_text_styles.dart';
// import 'package:partyspot/utils/constants/app_size.dart';
// import 'package:partyspot/utils/widgets/buttons.dart';
// import 'package:partyspot/utils/widgets/custom_svg_picture.dart';
//
// import '../alert_dialogs/loader_dialog.dart';
// import '../constants/color_consts.dart';
//
// Future showSuccessDialog(
//     {required String icon,
//     required BuildContext context,
//     String? description,
//     String? text,
//     required String buttonText,
//     Function()? onTapDone}) {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   width: 61.spW,
//                   height: 61.spW,
//                   child: CustomSvgPicture(
//                     iconPath: icon,
//                     fit: BoxFit.scaleDown,
//                   ),
//                 ),
//                 AppSizes.heightBox(boxHeight: 20),
//                 Visibility(
//                   visible: text != null && text.isNotEmpty,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.spW),
//                     child: Text(
//                       text ?? '',
//                       textAlign: TextAlign.center,
//                       maxLines: 3,
//                       style: AppTextStyles.get16BoldTextStyle(),
//                     ),
//                   ),
//                 ),
//                 if (description != null)
//                   Padding(
//                     padding: EdgeInsets.only(top: 16.spH),
//                     child: Text(
//                       description,
//                       textAlign: TextAlign.center,
//                       maxLines: 3,
//                       style: AppTextStyles.get12RegularTextStyle(),
//                     ),
//                   ),
//                 AppSizes.heightBox(boxHeight: 25),
//                 AppButton(
//                   buttonText,
//                   onPressed: onTapDone ??
//                       () {
//                         Get.back();
//                       },
//                   takeFullWidth: false,
//                   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }
//
// Future<void> showPermissionDeniedDialog({String? title, Function? onYes}) async {
//   BuildContext context = Get.context!;
//   return showCupertinoDialog<void>(
//     context: context,
//     builder: (BuildContext context) {
//       return CupertinoAlertDialog(
//         title: Text(
//           'Permission Denied',
//           style: AppTextStyles.get16MediumTextStyle(),
//         ),
//         content: Text(
//           title ?? 'Please allow permission from settings to continue using this feature.',
//           style: AppTextStyles.get14MediumTextStyle(color: AppColor.lightGreyTextColor),
//         ),
//         actions: <CupertinoDialogAction>[
//           CupertinoDialogAction(
//             child: Text(
//               'Cancel',
//               style: AppTextStyles.get14MediumTextStyle(),
//             ),
//             onPressed: () {
//               cancelDialog();
//             },
//           ),
//           CupertinoDialogAction(
//             child: Text(
//               'Settings',
//               style: AppTextStyles.get14MediumTextStyle(),
//             ),
//             onPressed: () async {
//               if (onYes != null) {
//                 onYes();
//               } else {
//                 await openAppSettings();
//               }
//               cancelDialog();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
