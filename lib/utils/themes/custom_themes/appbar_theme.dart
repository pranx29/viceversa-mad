import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VAppBarTheme {
  VAppBarTheme._();

  static const AppBarTheme lightAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 8,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      actionsIconTheme: IconThemeData(color: Colors.black, size: 24),
      titleTextStyle: TextStyle(
          color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
      iconTheme: IconThemeData(color: Colors.black, size: 24));

  static const AppBarTheme darkAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 8,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      actionsIconTheme: IconThemeData(color: Colors.white, size: 24),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      iconTheme: IconThemeData(color: Colors.white, size: 24));
}
