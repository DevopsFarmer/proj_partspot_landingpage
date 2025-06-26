import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/module/plan_a_wedding/data/models/plan_event_response.dart';
import 'package:partyspot/routes/routes_const.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/buttons.dart';
import 'package:partyspot/utils/widgets/custom_network_image.dart';
import 'package:partyspot/utils/widgets/snackbars.dart';
import 'package:url_launcher/url_launcher.dart';

class RepresentativeScreen extends StatelessWidget {
  final AssignedAgent? assignedAgent;
  const RepresentativeScreen({super.key, this.assignedAgent});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (val,_){
        Get.offAllNamed(Routes.appEntryScreen);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.deepPurple, AppColor.deepOrange],
                  begin: Alignment.center,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),

            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                    horizontal: 20,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.only(
                      top: 35,
                      bottom: 35,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AppColor.buttonOrange),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomNetworkImage(
                                    width: 100,
                                    height: 100,
                                    imageUrl: assignedAgent?.profilePictureUrl,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      assignedAgent?.fullName ?? '',
                                      style: AppTextStyles.get20BoldTextStyle(),
                                    ),
                                  ),

                                  Text(
                                    assignedAgent?.designation ?? '',
                                    style: AppTextStyles.get12RegularTextStyle(
                                      color: AppColor.colorB1B1B1,
                                    ),
                                  ),

                                  Divider(color: AppColor.colorE4E4E4),

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      StringConsts.about,
                                      style:
                                          AppTextStyles.get16SemiBoldTextStyle(),
                                    ),
                                  ),

                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      assignedAgent?.about ?? '',
                                      style: AppTextStyles.get12RegularTextStyle(
                                        color: AppColor.colorB1B1B1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: AppButton(
                            StringConsts.getOnCall,
                            onPressed: () {
                              makePhoneCall('${assignedAgent?.code ?? ''}${assignedAgent?.phone ?? ''}');
                            },
                            height: 50,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            textStyle: AppTextStyles.get14BoldTextStyle(
                              color: AppColor.whiteColor,
                            ),
                            backgroundColor: AppColor.buttonOrange,
                          ),
                        ),

                        AppButton(
                          StringConsts.connectOnWhatsapp,
                          onPressed: () {
                            openWhatsApp('${assignedAgent?.code ?? ''}${assignedAgent?.phone ?? ''}');
                          },
                          height: 50,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          textStyle: AppTextStyles.get14BoldTextStyle(
                            color: AppColor.whiteColor,
                          ),
                          backgroundColor: AppColor.buttonOrange,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void makePhoneCall(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      showSnackBar(text: StringConsts.invalidPhoneNumber, isError: true);
      return;
    }

    final Uri phoneUri = Uri.parse("tel:${phoneNumber.trim()}");

    launchUrl(phoneUri).catchError((_) {
      showSnackBar(text: StringConsts.couldNotOpenPhoneDialer, isError: true);
      return false;
    });
  }

  void openWhatsApp(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.trim().isEmpty) {
      showSnackBar(text: StringConsts.invalidPhoneNumber, isError: true);
      return;
    }

    final Uri whatsappUri = Uri.parse("https://wa.me/${phoneNumber.trim()}");

    launchUrl(whatsappUri).catchError((_) {
      showSnackBar(text: StringConsts.couldNotOpenPhoneDialer, isError: true);
      return false;
    });
  }

}
