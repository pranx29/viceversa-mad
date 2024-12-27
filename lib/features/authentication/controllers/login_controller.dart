import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viceversa/common/widgets/navigation_menu.dart';
import 'package:viceversa/data/repositories/authentication/authentication_repository.dart';
import 'package:viceversa/features/shop/screens/home/home_screen.dart';
import 'package:viceversa/utils/constants/enums.dart';
import 'package:viceversa/utils/constants/image_strings.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';
import 'package:viceversa/utils/helpers/network_manager.dart';
import 'package:viceversa/utils/popups/fullscreen_loader.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    // Check if Remember Me is Checked
    if (localStorage.read("REMEMBER_ME_EMAIL") != null &&
        localStorage.read("REMEMBER_ME_PASSWORD") != null) {
      email.text = localStorage.read("REMEMBER_ME_EMAIL");
      password.text = localStorage.read("REMEMBER_ME_PASSWORD");
      rememberMe.value = true;
    }
  }

  // Login Function
  Future<void> login() async {
    try {
      // Start Loading
      VTFullScreenLoader.openLoadingDialog(
          "We are processing your information...", VImages.loading);

      // Check Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      // Validate Form
      if (!loginFormKey.currentState!.validate()) {
        return;
      }

      // Save Data if Remember Me is Checked
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // Login User and Get Token
      final user = await AuthenticationRepository.instance
          .login(email.text.trim(), password.text.trim());

      // Remove Loader
      VTFullScreenLoader.closeLoadingDialog();

      // Show Success Message
      // VLoaders.successSnackBar(
      //     title: "Success",
      //     message: "Welcome ${user.firstName} ${user.lastName}");

      // Check Authentication Status and Navigate to Home Screen
      AuthenticationRepository.instance.checkAuthenticationStatus();

    } catch (e) {
      if (e is VError) {
        VLoaders.errorSnackBar(
          title: "Login Failed",
          message: VHelperFunctions.getErrorMessage(e),
        );
      } else {
        VLoaders.errorSnackBar(title: "Error", message: e.toString());
      }
    } finally {
      VTFullScreenLoader.closeLoadingDialog();
    }
  }
}
