import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/common/widgets/products/product_name_text.dart';
import 'package:viceversa/common/widgets/products/product_price_text.dart';
import 'package:viceversa/common/widgets/products/product_sizes_text.dart';
import 'package:viceversa/common/widgets/rounded_container.dart';
import 'package:viceversa/common/widgets/rounded_image.dart';
import 'package:viceversa/data/models/product_model.dart';
import 'package:viceversa/features/shop/controllers/product_controller.dart';
import 'package:viceversa/features/shop/screens/product_details/product_detail_screen.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/currency_mapper.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VProductCardVertical extends StatelessWidget {
  const VProductCardVertical({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    bool isDarkTheme = VHelperFunctions.isDarkMode(context);
    final discountPercentage =
        controller.calculateDiscountPercentage(product.price, product.discount);
    final price = controller.getProductPrice(product);

    final currency = CurrencyMapper.instance.currency;
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(product: product));
      },
      child: VRoundedContainer(
        backgroundColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                VRoundedImage(
                  image: product.images.first.path,
                  width: double.infinity,
                  height: 250,
                  isNetwork: true,
                ),
                if (discountPercentage != null)
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: VRoundedContainer(
                      width: 40,
                      height: 30,
                      borderRadius: VSizes.sm,
                      backgroundColor: isDarkTheme
                          ? VColor.primary.withValues(alpha: 0.5)
                          : VColor.primaryForeground.withValues(alpha: 0.5),
                      child: Center(
                        child: Text(
                          discountPercentage.toString(),
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    color: isDarkTheme
                                        ? VColor.primaryForeground
                                        : VColor.primary,
                                  ),
                        ),
                      ),
                    ),
                  ),
                // Positioned(
                //   top: 8,
                //   right: 8,
                //   child: VCircularIconButton(
                //     icon: CupertinoIcons.heart_fill,
                //     iconColor:
                //         isDarkTheme ? VColor.primaryForeground : VColor.primary,
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: VSizes.sm),

            // Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VProductNameText(name: product.name),
                const SizedBox(height: VSizes.xs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VProductPriceText(
                      price: price,
                      currency: currency,
                    ),
                    VProductSizesText(
                      sizes: product.sizes.length,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
