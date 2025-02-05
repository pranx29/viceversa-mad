import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/data/models/user_model.dart';
import 'package:viceversa/data/repositories/user_repository.dart';
import 'package:viceversa/features/personalization/controllers/user_controller.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class ChangeEmailController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();

  final userController = UserController.instance;
  final userRepository = UserRepository.instance;

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    email.text = userController.user.value.email;
    super.onInit();
  }

  void saveChanges(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      try {
        User user = User(
          id: userController.user.value.id,
          firstName: userController.user.value.firstName,
          lastName: userController.user.value.lastName,
          email: email.text,
          token: userController.user.value.token,
        );

        userRepository.updateUserDetails(user);

        userController.user.value = user;
        Get.back();
      } catch (e) {
        VLoaders.errorSnackBar(
            title: 'Error', message: 'Failed to update name');
      }
    }
  }
}
