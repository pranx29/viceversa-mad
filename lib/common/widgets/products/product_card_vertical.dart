import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:viceversa/common/widgets/circular_icon_button.dart';
import 'package:viceversa/common/widgets/rounded_container.dart';
import 'package:viceversa/common/widgets/rounded_image.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/image_strings.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VProductCardVertical extends StatelessWidget {
  const VProductCardVertical({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: VRoundedContainer(
        backgroundColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const VRoundedImage(image: VImages.tshirt1),
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VProductNameText(name: 'Cable Knit'),
                SizedBox(height: VSizes.xs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VProductPriceText(
                      price: '3,500',
                    ),
                    VProductSizesText(
                      sizes: 4,
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
