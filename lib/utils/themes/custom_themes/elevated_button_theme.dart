import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VElevatedButtonTheme {
  VElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: VColor.primaryForeground,
    backgroundColor: VColor.primary,
    side: const BorderSide(color: VColor.primary),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(VSizes.buttonRadius),
    ),
  ));

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: VColor.primary,
    backgroundColor: VColor.primaryForeground,
    side: const BorderSide(color: VColor.primaryForeground),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(VSizes.buttonRadius),
    ),
  ));
}
