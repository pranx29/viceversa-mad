import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/features/personalization/controllers/change_password_controller.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/validators/validation.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePasswordController controller =
        Get.put(ChangePasswordController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Enter your new password below.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: VSizes.spaceBtSections),
              TextFormField(
                controller: controller.newPassword,
                decoration: const InputDecoration(labelText: 'New Password'),
                obscureText: true,
                validator: (value) => VValidator.validatePassword(value),
              ),
              const SizedBox(height: VSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.confirmPassword,
                decoration:
                    const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) => VValidator.validateConfirmPassword(
                    controller.newPassword.text, value),
              ),
              const SizedBox(height: VSizes.spaceBtSections),
              ElevatedButton(
                onPressed: () => controller.saveChanges(context),
                child: const Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
