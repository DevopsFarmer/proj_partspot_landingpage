import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partyspot/module/profile/controller/user_detail_controller.dart';
import 'package:partyspot/module/settings/presentation/view/widgets/profile_card.dart';
import 'package:partyspot/module/settings/presentation/view/widgets/profile_img_circle.dart';
import 'package:partyspot/module/settings/presentation/view/widgets/settings_info.dart';
import 'package:partyspot/module/settings/presentation/view/widgets/settings_options.dart';
import 'package:partyspot/utils/classes/user_controller.dart';

import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';


class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  final UserController _userController = Get.find<UserController>();

  final UserDetailController userDetailController = Get.put(
    UserDetailController(),
  );

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
                  Expanded(flex: 12, child: SettingsOptions()),
                ],
              ),

              Align(
                alignment: Alignment(0, -0.5),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    Obx(
                      () => ProfileCard(
                        userName:
                            _userController.userData?.fullName?.toUpperCase() ??
                            '',
                        iconPath: AppIcons.crownIcon,
                        title: StringConsts.beastCaps,
                        subtitle: StringConsts.monthlySubs,
                        buttonText: StringConsts.upgrade,
                        onUpgradeTap: () {},
                      ),
                    ),
                    Positioned(
                      top: -70,
                      child: InkWell(
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              title: Text("Upload Image"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera_alt),
                                    title: Text("Camera"),

                                    onTap: () async {
                                      final ImagePicker picker = ImagePicker();
                                      final XFile? pickedFile = await picker
                                          .pickImage(
                                            source: ImageSource.camera,
                                            imageQuality: 80,
                                          );

                                      if (pickedFile != null) {
                                        File image = File(pickedFile.path);
                                        userDetailController.setUserImage(
                                          image,
                                        );
                                        await userDetailController
                                            .onUpdateProfilePic();
                                      }

                                      Get.back();
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo),
                                    title: Text("Gallery"),
                                    onTap: () async {
                                      final ImagePicker picker = ImagePicker();

                                      final XFile? pickedFile = await picker
                                          .pickImage(
                                            source: ImageSource.gallery,
                                            imageQuality: 80,
                                          );

                                      if (pickedFile != null) {
                                        File image = File(pickedFile.path);
                                        userDetailController.setUserImage(
                                          image,
                                        );
                                        await userDetailController
                                            .onUpdateProfilePic();
                                      }
                                      // Handle camera logic here
                                      Get.back();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Obx(() {
                          return ProfileImageStatus(
                            imageUrl:
                                _userController.userData?.profilePictureUrl ??
                                "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg",
                            percentage: 75,
                          );
                        }),
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
