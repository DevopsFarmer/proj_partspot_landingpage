import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class PriceRangeSlider extends StatefulWidget {
  final String? title;
  final Function(double min, double max)? onChanged;

  const PriceRangeSlider({
    super.key,
    this.title,
    this.onChanged,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  RangeValues _selectedRange = const RangeValues(2000, 8000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title ??
              'Price Range: ₹${_selectedRange.start.toInt()} - ₹${_selectedRange.end.toInt()}',
          style: AppTextStyles.get14MediumTextStyle(
            color: AppColor.color6F6F6F,
          ),
        ),
        const SizedBox(height: 16),
        SliderTheme(
          data:  SliderThemeData(
            overlayShape: SliderComponentShape.noOverlay,
          ),
          child: RangeSlider(
            values: _selectedRange,
            min: 0,
            max: 10000,
            divisions: 100,
            labels: RangeLabels(
              '₹${_selectedRange.start.toInt()}',
              '₹${_selectedRange.end.toInt()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _selectedRange = values;
              });

              // Callback to parent
              if (widget.onChanged != null) {
                widget.onChanged!(
                  values.start,
                  values.end,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
