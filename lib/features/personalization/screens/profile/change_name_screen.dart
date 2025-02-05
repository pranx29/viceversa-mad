import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/features/personalization/controllers/change_name_controller.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/validators/validation.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangeNameController controller = Get.put(ChangeNameController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Change Name',
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
                'Use real name for your account. This name will be used for your orders.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: VSizes.spaceBtSections),
              TextFormField(
                  controller: controller.firstName,
                  decoration: const InputDecoration(labelText: 'First Name'),
                  expands: false,
                  validator: (value) =>
                      VValidator.validateEmptyText('First name', value)),
              const SizedBox(height: VSizes.spaceBtwInputFields),
              TextFormField(
                controller: controller.lastName,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) =>
                    VValidator.validateEmptyText('Last name', value),
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
