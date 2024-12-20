import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/features/authentication/screens/welcome_screen.dart';
import 'package:viceversa/utils/themes/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: VAppTheme.lightTheme,
      darkTheme: VAppTheme.darkTheme,
      home: WelcomeScreen(),
    );
  }
}
