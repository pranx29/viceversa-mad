import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viceversa/utils/popups/fullscreen_loader.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage = GetStorage();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Login Function
  Future<void> login() async {
    try {
      // Start Loading
      // VTFullScreenLoader.openLoadingDialog(
      //     "We are processing your information...", VImages.loading);

      
    } catch (e) {
      // Stop Loading
      VTFullScreenLoader.closeLoadingDialog();
    }
  }
}
