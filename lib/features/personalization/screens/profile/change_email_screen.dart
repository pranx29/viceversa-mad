import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/features/personalization/controllers/change_email_controller.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/validators/validation.dart';

class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangeEmailController controller = Get.put(ChangeEmailController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Email',
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
                'Enter your new email address and confirm it.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: VSizes.spaceBtSections),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => VValidator.validateEmail(value),
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
