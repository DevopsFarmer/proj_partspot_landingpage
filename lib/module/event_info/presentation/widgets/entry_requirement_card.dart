import 'package:flutter/material.dart';
import 'package:partyspot/module/curated_events_list/data/models/curated_event_list_response.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';
import 'package:partyspot/utils/constants/icon_constants.dart';
import 'package:partyspot/utils/constants/string_consts.dart';
import 'package:partyspot/utils/widgets/custom_svg_picture.dart';

class EntryRequirementCard extends StatelessWidget {
  final List<EntryRequirement?>? entryRequirements;
  const EntryRequirementCard({super.key,this.entryRequirements});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: entryRequirements?.isNotEmpty ?? false,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.whiteColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringConsts.aboutEvent,style: AppTextStyles.get20BoldTextStyle()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: entryRequirements?.map((e){
                if((e?.list?.length ?? 0) > 1){
                  return _buildListDataItem(title: e?.title,list: e?.list);
                }else if((e?.list?.length ?? 0) == 1){
                  return _buildSingleDataItem(title: e?.title,text: e?.list?.firstOrNull);
                }else{
                  return SizedBox();
                }
              }).toList() ?? [],
            ),
            const SizedBox(height: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleDataItem({String? title, String? text}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title ?? '',style: AppTextStyles.get14SemiBoldTextStyle()),
          Text(text ?? '',style: AppTextStyles.get14RegularTextStyle(color: AppColor.darkGreyTextColor,)),
        ],
      ),
    );
  }

  Widget _buildListDataItem({String? title,List<String?>? list}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title ?? '',style: AppTextStyles.get14SemiBoldTextStyle(color: AppColor.darkGreyTextColor,)),
        const SizedBox(height: 4,),
        Column(
          children: List.generate(list?.length ?? 0, (index){
            return _buildAboutItem(text: list?[index] ?? '');
          }),
        ),
      ],
    );
  }

  _buildAboutItem({required String? text,}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CustomSvgPicture(iconPath: AppIcons.infoIcon,width: 21,height: 21),
          const SizedBox(width: 14),
          Expanded(child: Text(text ?? '',style: AppTextStyles.get14RegularTextStyle(color: AppColor.darkGreyTextColor),)),
        ],
      ),
    );
  }
}
