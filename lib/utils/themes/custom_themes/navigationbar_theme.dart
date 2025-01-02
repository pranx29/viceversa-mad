import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';

class VNavigationBarTheme {
  VNavigationBarTheme._();

  static NavigationBarThemeData lightNavigationBarTheme =
      NavigationBarThemeData(
    backgroundColor: VColor.primary,
    indicatorColor: VColor.primary.withValues(alpha: 0.1),
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(color: VColor.primary),
    ),
    iconTheme: WidgetStateProperty.all(
      const IconThemeData(color: VColor.primary, size: 24),
    ),
  );

  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    backgroundColor: VColor.primaryForeground,
    indicatorColor: VColor.primaryForeground.withValues(alpha: 0.1),
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(
        color: VColor.primaryForeground,
      ),
    ),
    iconTheme: WidgetStateProperty.all(
      const IconThemeData(color: VColor.primaryForeground),
    ),
  );
}
