import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/common/widgets/products/product_name_text.dart';
import 'package:viceversa/common/widgets/products/product_price_text.dart';
import 'package:viceversa/common/widgets/rounded_image.dart';
import 'package:viceversa/data/models/cart_item_model.dart';
import 'package:viceversa/features/shop/controllers/cart_controller.dart';
import 'package:viceversa/features/shop/screens/cart/widgets/product_quanity_setter.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VCartItem extends StatelessWidget {
  const VCartItem({
    super.key,
    required this.item,
  });

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        VRoundedImage(
          imageBorder: false,
          width: 100,
          height: 100,
          borderRadius: VSizes.sm,
          padding: const EdgeInsets.symmetric(horizontal: VSizes.sm),
          border: Border.all(
              color: isDarkTheme ? VColor.primaryForeground : VColor.primary,
              width: 0.5),
          image: item.image,
          isNetwork: true,
        ),
        const SizedBox(width: VSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VProductNameText(name: item.name),
            Text('Size: ${item.size}',
                style: Theme.of(context).textTheme.labelMedium),
            VProductPriceText(price: (item.price * item.quantity).toString()),
            const SizedBox(height: VSizes.xs),
            VProductQuanitySetter(cartItem: item),
          ],
        ),
        const Spacer(),
        IconButton(
            onPressed: () {
              CartController.instance.removeCartItem(item, isDarkTheme);
            },
            icon: const Icon(Iconsax.trash)),
      ],
    );
  }
}
