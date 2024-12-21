import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VTextFormFieldTheme {
  VTextFormFieldTheme._();

  static final lightTextFormFieldTheme = InputDecorationTheme(
    filled: true,
    fillColor: VColor.secondaryForeground,
    suffixIconColor: VColor.primary,
    prefixIconColor: VColor.primary,
    hintStyle: const TextStyle(color: VColor.secondary),
    labelStyle: const TextStyle(color: VColor.secondary),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: const BorderSide(color: VColor.secondary),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: const BorderSide(color: VColor.primary),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: const BorderSide(color: VColor.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  );

  static final darkTextFormFieldTheme = InputDecorationTheme(
    filled: true,
    fillColor: VColor.secondary,
    suffixIconColor: VColor.secondaryForeground,
    prefixIconColor: VColor.secondaryForeground,
    hintStyle: const TextStyle(color: VColor.secondaryForeground),
    labelStyle: const TextStyle(color: VColor.secondaryForeground),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: const BorderSide(color: VColor.secondaryForeground),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: const BorderSide(color: VColor.primaryForeground),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: const BorderSide(color: VColor.primaryForeground),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(VSizes.inputFieldRadius),
      borderSide: BorderSide.none,
    ),
  );
}
