import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:viceversa/common/widgets/products/product_name_text.dart';
import 'package:viceversa/data/models/product_model.dart';
import 'package:viceversa/features/shop/controllers/cart_controller.dart';
import 'package:viceversa/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:viceversa/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:viceversa/features/shop/screens/product_details/widgets/product_sizes.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    cartController.selectedSize = product.sizes.first.name.obs;
    cartController.isInStock.value =
        cartController.getSelectedSizeStockStatus(product);
    final isDarkMode = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: VColor.productBackground,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageSlider(images: product.images),
            // Product Details
            Padding(
              padding: const EdgeInsets.only(
                  top: VSizes.defaultSpace,
                  left: VSizes.defaultSpace,
                  right: VSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.category.name,
                          style: Theme.of(context).textTheme.labelLarge),
                      Obx(() {
                        return Row(
                          children: [
                            Icon(
                              cartController.isInStock.value
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              color: cartController.isInStock.value
                                  ? (isDarkMode
                                      ? VColor.positiveDark
                                      : VColor.positive)
                                  : (isDarkMode
                                      ? VColor.negativeDark
                                      : VColor.negative),
                              size: 20,
                            ),
                            const SizedBox(width: VSizes.spaceBtwItems / 2),
                            Text(
                              cartController.isInStock.value
                                  ? 'In Stock'
                                  : 'Out of Stock',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: cartController.isInStock.value
                                        ? (isDarkMode
                                            ? VColor.positiveDark
                                            : VColor.positive)
                                        : (isDarkMode
                                            ? VColor.negativeDark
                                            : VColor.negative),
                                  ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems / 2),
                  VProductNameText(
                    name: product.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems / 2),

                  ReadMoreText(
                    product.description,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: const TextStyle(fontWeight: FontWeight.bold),
                    lessStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems),

                  // Sizes
                  VProductSizes(product: product),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: VBottomAddToCart(
        product: product,
      ),
    );
  }
}
