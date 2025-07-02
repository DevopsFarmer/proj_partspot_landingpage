import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partyspot/module/party_spot_vip/view/widgets/plan_benefits.dart';
import 'package:partyspot/module/party_spot_vip/view/widgets/vip_plans_row.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

class VipScreen extends StatelessWidget {
  const VipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.deepPurple, AppColor.deepOrange],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
          ),

          SafeArea(
            child: SizedBox(
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    StringConsts.comingSoon,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.get24BoldTextStyle(
                      color: AppColor.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // SafeArea(
          //   child: SingleChildScrollView(
          //     child: Padding(
          //       padding: const EdgeInsets.all(12.0),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [

          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text(
          //                 StringConsts.joinVip,
          //                 textAlign: TextAlign.center,
          //                 style: AppTextStyles.get24BoldTextStyle(
          //                   color: AppColor.whiteColor,
          //                 ),
          //               ),
          //             ],
          //           ),

          //           Padding(
          //             padding: const EdgeInsets.symmetric(vertical: 14.0),
          //             child: Text(
          //               StringConsts.vipSubscribe,
          //               textAlign: TextAlign.center,
          //               style: AppTextStyles.get16RegularTextStyle(
          //                 color: AppColor.whiteColor,
          //               ),
          //             ),
          //           ),

          //           VipPlansRow(),

          //           PlanBenefits(),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
