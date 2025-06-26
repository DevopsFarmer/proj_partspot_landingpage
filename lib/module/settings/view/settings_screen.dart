import 'package:flutter/material.dart';
import 'package:partyspot/module/settings/view/widgets/profile_card.dart';
import 'package:partyspot/module/settings/view/widgets/profile_img_circle.dart';
import 'package:partyspot/module/settings/view/widgets/settings_info.dart';
import 'package:partyspot/module/settings/view/widgets/settings_options.dart';

import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';

// import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 8,
                    child: SettingsInfo(onNotificationTap: () {}),
                  ),
                  Expanded(flex: 12, child:  SettingsOptions()),
                ],
              ),

              Align(
                alignment: Alignment(0, -0.5),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    ProfileCard(
                      userName: 'UTSAV SHARMA',
                      iconPath: AppIcons.crownIcon,
                      title: StringConsts.beastCaps,
                      subtitle: StringConsts.monthlySubs,
                      buttonText: StringConsts.upgrade,
                      onUpgradeTap: () {},
                    ),
                    Positioned(
                      top: -70,
                      child: ProfileImageStatus(
                        imageUrl:
                            "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                        percentage: 75,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
