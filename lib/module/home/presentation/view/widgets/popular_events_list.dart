import 'package:flutter/material.dart';
import 'package:partyspot/module/home/presentation/view/widgets/event_item.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart'
    show AppTextStyles;
import 'package:partyspot/utils/constants/string_consts.dart' show StringConsts;

class PopularEventsList extends StatelessWidget {
  final bool showText;
  PopularEventsList({super.key, this.showText = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showText
              ? Text(
                StringConsts.popularEvents,
                style: AppTextStyles.get20MediumTextStyle(),
              )
              : SizedBox(),
          const SizedBox(height: 8),
          Column(
            children: List.generate(13, (index) {
              return EventItem(
                title: "EDM SUNDAY",
                desc: "The Blue Dot Cafe",
              );
            }),
          ),
        ],
      ),
    );
  }
}
