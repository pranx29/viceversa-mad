import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viceversa/data/repositories/authentication/authentication_repository.dart';
import 'package:viceversa/features/authentication/screens/login_screen.dart';
import 'package:viceversa/utils/constants/image_strings.dart';
import 'package:viceversa/utils/helpers/network_manager.dart';
import 'package:viceversa/utils/popups/fullscreen_loader.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  // Register Function
  Future<void> register() async {
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
      if (!registerFormKey.currentState!.validate()) {
        return;
      }

      // Register User and Get Token
      final user = await AuthenticationRepository.instance.register(
          firstName.text.trim(),
          lastName.text.trim(),
          email.text.trim(),
          password.text.trim());

      // Show Success Message
      VLoaders.successSnackBar(
          title: "Success",
          message: "Welcome ${user.firstName} ${user.lastName}");
    } catch (e) {
      VLoaders.errorSnackBar(title: "Error", message: e.toString());
    } finally {
      VTFullScreenLoader.closeLoadingDialog();
    }
  }
}
