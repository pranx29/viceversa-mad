import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/common/widgets/rounded_container.dart';
import 'package:viceversa/data/models/address_model.dart';
import 'package:viceversa/features/personalization/controllers/address_controller.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VAddress extends StatelessWidget {
  const VAddress({
    super.key,
    required this.address,
    required this.onTap,
  });

  final Address address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    final addressController = AddressController.instance;
    return GestureDetector(
      onTap: onTap,
      child: Obx(() {
        // Move the observable usage inside Obx
        final bool selectedAddress =
            addressController.selectedAddressIndex.value ==
                addressController.addresses.indexOf(address);

        return VRoundedContainer(
          width: double.infinity,
          backgroundColor: selectedAddress
              ? (isDarkTheme ? VColor.secondary : VColor.secondaryForeground)
              : Colors.transparent,
          borderWidth: selectedAddress ? 0 : 1,
          borderColor:
              isDarkTheme ? VColor.secondaryForeground : VColor.secondary,
          margin: const EdgeInsets.only(bottom: VSizes.spaceBtwItems),
          padding: VSizes.md,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 5,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: isDarkTheme
                      ? VColor.secondaryForeground
                      : VColor.secondary,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${address.firstName ?? ''} ${address.lastName ?? ''}',
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: VSizes.xs / 2),
                  Text(
                    address.phoneNumber,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: true,
                  ),
                  const SizedBox(height: VSizes.xs / 2),
                  Text(
                    '${address.street}, ${address.city}, ${address.postalCode}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
