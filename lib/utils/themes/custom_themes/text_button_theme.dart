import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';

class VTextButtonTheme {
  VTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: VColor.primary,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: VColor.primaryForeground,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
