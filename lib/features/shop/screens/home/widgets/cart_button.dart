import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/features/shop/controllers/cart_controller.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VCartCountIconButton extends StatelessWidget {
  const VCartCountIconButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    final controller = Get.put(CartController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
      child: Stack(
        children: [
          IconButton(
            icon: const Icon(Iconsax.shopping_cart),
            onPressed: onPressed,
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: isDarkTheme
                      ? VColor.primaryForeground.withAlpha(200)
                      : VColor.primary.withAlpha(200),
                  borderRadius: BorderRadius.circular(VSizes.borderRadiusFull)),
              child: Center(
                  child: Obx(() => Text(controller.cartCount.toString(),
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: isDarkTheme
                              ? VColor.primary
                              : VColor.primaryForeground)))),
            ),
          )
        ],
      ),
    );
  }
}
