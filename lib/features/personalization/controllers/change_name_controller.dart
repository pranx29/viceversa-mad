import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/data/models/user_model.dart';
import 'package:viceversa/data/repositories/user_repository.dart';
import 'package:viceversa/features/personalization/controllers/user_controller.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class ChangeNameController extends GetxController {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final userController = UserController.instance;
  final userRepository = UserRepository.instance;

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
    super.onInit();
  }

  void saveChanges(BuildContext context) {
    if (formKey.currentState!.validate()) {
      try {
        User user = User(
          id: userController.user.value.id,
          firstName: firstName.text,
          lastName: lastName.text,
          email: userController.user.value.email,
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
