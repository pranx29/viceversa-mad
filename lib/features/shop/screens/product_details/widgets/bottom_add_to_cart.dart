import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/common/widgets/products/product_price_text.dart';
import 'package:viceversa/data/models/product_model.dart';
import 'package:viceversa/features/shop/controllers/cart_controller.dart';
import 'package:viceversa/features/shop/controllers/product_controller.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/currency_mapper.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VBottomAddToCart extends StatelessWidget {
  final Product product;

  const VBottomAddToCart({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    final controller = CartController.instance;

    final productController = Get.find<ProductController>();
    final currentcy = CurrencyMapper.instance.currency;
    final price = productController.getProductPrice(product);

    return Container(
      padding: const EdgeInsets.only(
        left: VSizes.defaultSpace,
        right: VSizes.defaultSpace,
        top: VSizes.defaultSpace,
        bottom: VSizes.xl,
      ),
      decoration: BoxDecoration(
        color: isDarkTheme ? VColor.secondary : VColor.secondaryForeground,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(VSizes.cardRadiusLg),
          topRight: Radius.circular(VSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (product.discount != null && product.discount! > 0)
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                VProductPriceText(
                  currency: currentcy,
                  price: productController.getProductOriginalPrice(product),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decoration: TextDecoration.lineThrough,
                      ),
                ),
                const SizedBox(width: VSizes.spaceBtwItems),
                VProductPriceText(
                  price: price,
                  currency: currentcy,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          if (product.discount == null || product.discount! <= 0)
            VProductPriceText(
              price: price,
              currency: currentcy,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

          // Add to Cart Button
          ElevatedButton(
              onPressed: () {
                controller.addToCart(product, 1);
              },
              child: Row(
                children: [
                  Icon(Iconsax.shopping_cart,
                      color: isDarkTheme
                          ? VColor.primary
                          : VColor.primaryForeground),
                  const SizedBox(width: VSizes.spaceBtwItems),
                  const Text('Add to Cart'),
                ],
              )),
        ],
      ),
    );
  }
}
