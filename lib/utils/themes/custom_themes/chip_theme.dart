import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';

class VChipTheme {
  VChipTheme._();

  /// Customizable Light Choice Chip Theme
  static ChipThemeData lightChoiceChipTheme = const ChipThemeData(
      disabledColor: VColor.secondaryForeground,
      labelStyle: TextStyle(color: VColor.primary),
      backgroundColor: VColor.primaryForeground,
      selectedColor: VColor.primary,
      secondaryLabelStyle: TextStyle(color: VColor.primaryForeground),
      checkmarkColor: VColor.primaryForeground,
      side: BorderSide(
        color: VColor.primary,
        width: 1,
        style: BorderStyle.solid,
      ));

  /// Customizable Dark Choice Chip Theme
  static ChipThemeData darkChoiceChipTheme = const ChipThemeData(
      disabledColor: VColor.secondaryForeground,
      labelStyle: TextStyle(color: VColor.primaryForeground),
      backgroundColor: VColor.primary,
      selectedColor: VColor.primaryForeground,
      secondaryLabelStyle: TextStyle(color: VColor.primary),
      checkmarkColor: VColor.primary,
      side: BorderSide(
        color: VColor.primaryForeground,
        width: 1,
        style: BorderStyle.solid,
      ));
}
