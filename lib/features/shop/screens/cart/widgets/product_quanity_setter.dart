import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/common/widgets/circular_icon_button.dart';
import 'package:viceversa/data/models/cart_item_model.dart';
import 'package:viceversa/features/shop/controllers/cart_controller.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VProductQuanitySetter extends StatelessWidget {
  final CartItem cartItem;

  const VProductQuanitySetter({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    final controller = CartController.instance;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        VCircularIconButton(
          icon: Iconsax.minus,
          borderRadius: VSizes.sm,
          width: 32,
          height: 32,
          size: VSizes.md,
          iconColor: isDarkTheme ? VColor.primary : VColor.primaryForeground,
          backgroundColor:
              isDarkTheme ? VColor.primaryForeground : VColor.primary,
          onPressed: () {
            controller.decrementCartItemQuantity(cartItem);
          },
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
        SizedBox(
          width: 10,
          child: Text('${cartItem.quantity}',
              style: Theme.of(context).textTheme.titleSmall),
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
        VCircularIconButton(
          borderRadius: VSizes.sm,
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: VSizes.md,
          iconColor: isDarkTheme ? VColor.primary : VColor.primaryForeground,
          backgroundColor:
              isDarkTheme ? VColor.primaryForeground : VColor.primary,
          onPressed: () {
            controller.incrementCartItemQuantity(cartItem);
          },
        ),
      ],
    );
  }
}
