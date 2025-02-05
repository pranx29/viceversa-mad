import 'package:flutter/material.dart';
import 'package:viceversa/features/personalization/controllers/address_controller.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/validators/validation.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Address',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    controller.useCurrentLocation();
                  },
                  child: Text('Use Current Location')),
              // First Name
              TextFormField(
                  controller: controller.firstName,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    labelText: 'First Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  validator: (value) =>
                      VValidator.validateEmptyText('First name', value)),
              const SizedBox(height: VSizes.spaceBtwInputFields),

              // Last Name
              TextFormField(
                controller: controller.lastName,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'Last Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) =>
                    VValidator.validateEmptyText('Last name', value),
              ),
              const SizedBox(height: VSizes.spaceBtwInputFields),

              TextFormField(
                controller: controller.street,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.location_on),
                  labelText: 'Street',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) =>
                    VValidator.validateEmptyText('Street', value),
              ),

              const SizedBox(height: VSizes.spaceBtwInputFields),

              Row(
                children: [
                  // City
                  Expanded(
                    child: TextFormField(
                      controller: controller.city,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.location_city),
                        labelText: 'City',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) =>
                          VValidator.validateEmptyText('City', value),
                    ),
                  ),
                  const SizedBox(width: VSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                        controller: controller.postalCode,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.near_me_sharp),
                          labelText: 'Postal Code',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) =>
                            VValidator.validatePostalCode(value)),
                  ),
                ],
              ),

              const SizedBox(height: VSizes.spaceBtwInputFields),

              // Phone Number
              TextFormField(
                controller: controller.phoneNumber,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone),
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                validator: (value) => VValidator.validatePhoneNumber(value),
              ),
              const SizedBox(height: VSizes.spaceBtSections),

              // Submit Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    controller.addAddress();
                  },
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
