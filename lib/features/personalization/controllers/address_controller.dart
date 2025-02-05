import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/data/models/address_model.dart';
import 'package:viceversa/data/repositories/user_repository.dart';
import 'package:viceversa/features/personalization/controllers/user_controller.dart';
import 'package:viceversa/utils/helpers/geolocator.dart';
import 'package:viceversa/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final userController = UserController.instance;
  final userRepository = UserRepository.instance;
  RxList<Address> addresses = <Address>[].obs;

  // Add address form
  final formKey = GlobalKey<FormState>();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final postalCode = TextEditingController();
  final phoneNumber = TextEditingController();

  // Select address
  Rx<int> selectedAddressIndex = 0.obs;

  @override
  void onInit() {
    addresses.value = userController.user.value.addresses;
    super.onInit();
  }

  void addAddress() {
    if (formKey.currentState?.validate() ?? false) {
      try {
        final newAddress = Address(
          firstName: firstName.text,
          lastName: lastName.text,
          street: street.text,
          city: city.text,
          postalCode: postalCode.text,
          phoneNumber: phoneNumber.text,
        );
        userRepository.addAddress(newAddress);
        addresses.add(newAddress);
        Get.back();
      } catch (e) {
        VLoaders.errorSnackBar(
            title: 'Error', message: 'Failed to add address');
      }
    }
  }

  // Use current location
  Future<void> useCurrentLocation() async {
    try {
      final locationDetails = await GeoLocator.instance.getLocationDetails();
      street.text = locationDetails['street'] as String;
      city.text = locationDetails['city'] as String;
      postalCode.text = locationDetails['postalCode'] as String;
    } catch (e) {
      VLoaders.errorSnackBar(
          title: 'Error', message: 'Failed to get current location');
    }
  }
}
