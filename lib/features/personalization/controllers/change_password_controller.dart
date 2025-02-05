import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/data/repositories/user_repository.dart';
import 'package:viceversa/features/personalization/controllers/user_controller.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class ChangePasswordController extends GetxController {
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final userController = UserController.instance;
  final userRepository = UserRepository.instance;

  @override
  void onClose() {
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }

  void saveChanges(BuildContext context) {
    if (formKey.currentState!.validate()) {
      try {
        userRepository.updatePassword(
          newPassword.text,
        );

        Get.back();
      } catch (e) {
        VLoaders.errorSnackBar(
            title: 'Error', message: 'Failed to update password');
      }
    }
  }
}
