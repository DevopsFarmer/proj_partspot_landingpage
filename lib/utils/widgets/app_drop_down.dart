import 'package:flutter/material.dart';
import 'package:partyspot/utils/constants/color_consts.dart';

class AppDropDown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String? hint;
  final String? Function(T?)? validator;
  final Color? color;
  final BorderSide? borderSide;

  const AppDropDown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint,
    this.validator,
    this.color,
    this.borderSide
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: color ?? AppColor.fieldBgColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: borderSide ?? BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.blue.shade300,
            width: 1.5,
          ),
        ),
      ),
      validator: validator,
      icon: Icon(Icons.keyboard_arrow_down_rounded),
      dropdownColor: AppColor.fieldBgColor,
    );
  }
}