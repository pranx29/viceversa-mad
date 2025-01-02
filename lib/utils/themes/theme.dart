import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/themes/custom_themes/checkbox_theme.dart';
import 'package:viceversa/utils/themes/custom_themes/navigationbar_theme.dart';
import 'package:viceversa/utils/themes/custom_themes/outline_button_theme.dart';
import 'package:viceversa/utils/themes/custom_themes/text_button_theme.dart';
import 'package:viceversa/utils/themes/custom_themes/text_theme.dart';
import 'package:viceversa/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:viceversa/utils/themes/custom_themes/appbar_theme.dart';
import 'package:viceversa/utils/themes/custom_themes/text_field_theme.dart';

class VAppTheme {
  VAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: VColor.secondaryForeground,
      scaffoldBackgroundColor: VColor.primaryForeground,
      textTheme: VTextTheme.lightTextTheme,
      elevatedButtonTheme: VElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: VOutlinedButtonTheme.lightOutlinedButtonTheme,
      textButtonTheme: VTextButtonTheme.lightTextButtonTheme,
      checkboxTheme: VCheckboxTheme.lightCheckboxTheme,
      appBarTheme: VAppBarTheme.lightAppBarTheme,
      inputDecorationTheme: VTextFormFieldTheme.lightTextFormFieldTheme,
      navigationBarTheme: VNavigationBarTheme.lightNavigationBarTheme);

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: VColor.secondary,
      scaffoldBackgroundColor: VColor.primary,
      textTheme: VTextTheme.darkTextTheme,
      elevatedButtonTheme: VElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: VOutlinedButtonTheme.darkOutlinedButtonTheme,
      textButtonTheme: VTextButtonTheme.darkTextButtonTheme,
      checkboxTheme: VCheckboxTheme.darkCheckboxTheme,
      appBarTheme: VAppBarTheme.darkAppBarTheme,
      inputDecorationTheme: VTextFormFieldTheme.darkTextFormFieldTheme,
      navigationBarTheme: VNavigationBarTheme.darkNavigationBarTheme);
}
