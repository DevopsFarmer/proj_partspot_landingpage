import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class ExploreTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onFilterTap;

  const ExploreTextField({
    Key? key,
    required this.controller,
    required this.onChanged,
    required this.onFilterTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppTextStyles.get16RegularTextStyle(),
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        hintStyle: AppTextStyles.get16RegularTextStyle(),
        hintText: StringConsts.search,
        filled: true,
        fillColor: AppColor.whiteColor,
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CustomImageAsset(image: AppIcons.searchIcon, height: 30),
        ),
        suffixIcon: InkWell(
          onTap: onFilterTap,
          child: CustomImageAsset(
            image: AppIcons.filterIcon,
            height: 30,
            // fit: BoxFit.fill,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(minWidth: 40),
        prefixIconConstraints: const BoxConstraints(minWidth: 40),
      ),
    );
  }
}
