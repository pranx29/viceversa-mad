// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';

class VTextTheme {
  VTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: VColor.primary),
    headlineMedium: TextStyle().copyWith(
        fontSize: 24.0, fontWeight: FontWeight.w600, color: VColor.primary),
    headlineSmall: TextStyle().copyWith(
        fontSize: 18.0, fontWeight: FontWeight.w600, color: VColor.primary),
    titleLarge: TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: VColor.primary),
    titleMedium: TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w500, color: VColor.primary),
    titleSmall: TextStyle().copyWith(
        fontSize: 16.0, fontWeight: FontWeight.w400, color: VColor.secondary),
    bodyLarge: TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: VColor.primary),
    bodyMedium: TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.w500, color: VColor.primary),
    bodySmall: TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: VColor.secondary),
    labelLarge: TextStyle().copyWith(
        fontSize: 14.0, fontWeight: FontWeight.normal, color: VColor.secondary),
    labelMedium: TextStyle().copyWith(
        fontSize: 12.0, fontWeight: FontWeight.normal, color: VColor.secondary),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: VColor.primaryForeground),
    headlineMedium: TextStyle().copyWith(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: VColor.primaryForeground),
    headlineSmall: TextStyle().copyWith(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: VColor.primaryForeground),
    titleLarge: TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: VColor.primaryForeground),
    titleMedium: TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: VColor.primaryForeground),
    titleSmall: TextStyle().copyWith(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: VColor.secondaryForeground),
    bodyLarge: TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: VColor.primaryForeground),
    bodyMedium: TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: VColor.primaryForeground),
    bodySmall: TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: VColor.secondaryForeground),
    labelLarge: TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: VColor.secondaryForeground),
    labelMedium: TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: VColor.secondaryForeground),
  );
}
