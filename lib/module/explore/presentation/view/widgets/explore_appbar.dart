import 'package:flutter/material.dart';
import 'package:partyspot/module/explore/presentation/view/widgets/explore_text_field.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/image_consts.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/widgets/custom_image_asset.dart';

class CustomExploreAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final TextEditingController textController;
  final VoidCallback onFilterTap;
  final VoidCallback onNotificationTap;
  final ValueChanged<String> onSearchChanged;

  const CustomExploreAppBar({
    Key? key,
    required this.textController,
    required this.onFilterTap,
    required this.onNotificationTap,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Row(
          children: [
            Text(
              StringConsts.exploreEvnts,
              style: AppTextStyles.get20BoldTextStyle(
                color: AppColor.whiteColor,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: onNotificationTap,
              child: CustomImageAsset(image: AppIcons.exploreBell, height: 35),
            ),
          ],
        ),
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [Image.asset(AppImages.appBarImg, fit: BoxFit.cover)],
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.blackColor.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(4, 8),
                  ),
                ],
              ),
              child: ExploreTextField(
                controller: textController,
                onChanged: onSearchChanged,
                onFilterTap: onFilterTap,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
