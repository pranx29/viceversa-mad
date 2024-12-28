import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viceversa/common/widgets/circular_icon_button.dart';
import 'package:viceversa/common/widgets/rounded_container.dart';
import 'package:viceversa/common/widgets/rounded_image.dart';
import 'package:viceversa/data/models/product_model.dart';
import 'package:viceversa/features/shop/controllers/product_controller.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
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
    return GestureDetector(
      onTap: () {
        debugPrint('Product Tapped: ${product.name}');
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
                Positioned(
                  top: 8,
                  right: 8,
                  child: VCircularIconButton(
                    icon: CupertinoIcons.heart_fill,
                    iconColor:
                        isDarkTheme ? VColor.primaryForeground : VColor.primary,
                  ),
                ),
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
                      price: product.price.toStringAsFixed(2),
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

class VProductSizesText extends StatelessWidget {
  const VProductSizesText({
    super.key,
    required this.sizes,
  });

  final int sizes;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$sizes Sizes',
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}

class VProductPriceText extends StatelessWidget {
  const VProductPriceText({
    super.key,
    required this.price,
    this.currency = 'LKR',
    this.lineThrough = false,
  });

  final String price;
  final String currency;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$currency $price',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            decoration: lineThrough ? TextDecoration.lineThrough : null,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class VProductNameText extends StatelessWidget {
  const VProductNameText({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: Theme.of(context).textTheme.labelLarge,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
