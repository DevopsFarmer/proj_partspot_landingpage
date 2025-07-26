import 'package:flutter/material.dart';
import 'package:partyspot/utils/classes/app_text_styles.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class PriceRangeSlider extends StatefulWidget {
  final String? title;
  final Function(double min, double max)? onChanged;
  final double? initialMin;
  final double? initialMax;

  const PriceRangeSlider({
    super.key,
    this.title,
    this.onChanged,
    this.initialMin,
    this.initialMax,
  });

  @override
  State<PriceRangeSlider> createState() => _PriceRangeSliderState();
}

class _PriceRangeSliderState extends State<PriceRangeSlider> {
  late RangeValues _selectedRange;

  @override
  void initState() {
    super.initState();
    _selectedRange = RangeValues(
      widget.initialMin ?? 2000,
      widget.initialMax ?? 8000,
    );
  }

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
          data: SliderThemeData(
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

              if (widget.onChanged != null) {
                widget.onChanged!(values.start, values.end);
              }
            },
          ),
        ),
      ],
    );
  }
}
