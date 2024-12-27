import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viceversa/bindings/general_bindings.dart';
import 'package:viceversa/data/repositories/authentication/authentication_repository.dart';
import 'package:viceversa/data/services/authentication_service.dart';
import 'package:viceversa/features/authentication/screens/welcome_screen.dart';
import 'package:viceversa/utils/themes/theme.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  runApp(const MainApp());

  // Widget Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage
  await GetStorage.init();

  // Load the dependencies
  Get.put(AuthenticationService());
  Get.put(AuthenticationRepository());

  // Wait for the dependencies to load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Check the authentication status and redirect the user to the appropriate screen
  AuthenticationRepository.instance.checkAuthenticationStatus();
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
      initialBinding: GeneralBindings(),
    );
  }
}
