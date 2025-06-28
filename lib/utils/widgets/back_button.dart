import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class AppBackButton extends StatelessWidget {
  final Function()? onTap;
  const AppBackButton({super.key,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.whiteColor,
        ),
        child: Icon(Icons.arrow_back_rounded,size: 14,),
      ),
    );
  }
}
