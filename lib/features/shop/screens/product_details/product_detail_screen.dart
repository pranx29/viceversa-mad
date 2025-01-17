import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:viceversa/common/widgets/products/product_name_text.dart';
import 'package:viceversa/data/models/product_model.dart';
import 'package:viceversa/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:viceversa/features/shop/screens/product_details/widgets/product_image_slider.dart';
import 'package:viceversa/features/shop/screens/product_details/widgets/product_sizes.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
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
                      Text(product.isActive ? 'In Stock' : 'Out of Stock',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems / 2),
                  VProductNameText(
                    name: product.name,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: VSizes.spaceBtwItems / 2),

                  const ReadMoreText(
                    "This flannel button-up shirt is made from 100% cotton and features a classic plaid pattern. It has a regular fit, long sleeves, and a button-up front. It is perfect for casual wear.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Show less',
                    moreStyle: TextStyle(fontWeight: FontWeight.bold),
                    lessStyle: TextStyle(fontWeight: FontWeight.bold),
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
