import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/features/personalization/controllers/address_controller.dart';
import 'package:viceversa/features/personalization/screens/address/add_address_screen.dart';
import 'package:viceversa/features/personalization/screens/address/widgets/address_container.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    final addressController = Get.put(AddressController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: isDarkTheme ? VColor.primaryForeground : VColor.primary),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor:
              isDarkTheme ? VColor.primaryForeground : VColor.primary,
          child: Icon(Iconsax.add,
              color: isDarkTheme ? VColor.primary : VColor.primaryForeground),
          onPressed: () => Get.to(const AddAddressScreen())),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: addressController.addresses.length,
            itemBuilder: (context, index) {
              return VAddress(
                address: addressController.addresses[index],
                onTap: () {
                  addressController.selectedAddressIndex.value = index;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
