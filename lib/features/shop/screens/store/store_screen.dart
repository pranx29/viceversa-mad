import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/common/widgets/layouts/grid_layout.dart';
import 'package:viceversa/common/widgets/products/product_card_vertical.dart';
import 'package:viceversa/features/shop/screens/store/widgets/search_bar.dart';
import 'package:viceversa/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:viceversa/features/shop/controllers/product_controller.dart';
import 'package:viceversa/features/shop/screens/store/widgets/category_selecter.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: VSizes.appBarHeight),
            VSearchContainer(onChanged: (value) {
              controller.fetchProductsBySearchQuery(value);
            }),
            const SizedBox(height: VSizes.spaceBtSections),
            const VCategories(),

            // Best  Products
            Obx(() {
              if (controller.isLoading.value) {
                return const Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: VSizes.defaultSpace,
                      vertical: VSizes.defaultSpace / 2),
                  child: VVerticalProductShimmer(),
                );
              }
              if (controller.allProducts.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(VSizes.defaultSpace),
                  child: Center(
                      child: Text('No Products Found',
                          style: Theme.of(context).textTheme.bodyMedium)),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: VSizes.defaultSpace,
                    vertical: VSizes.defaultSpace / 2),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Products Grid
                      VGridLayout(
                          itemCount: controller.allProducts.length,
                          itemBuilder: (_, index) => VProductCardVertical(
                              product: controller.allProducts[index]))
                    ]),
              );
            }),
          ],
        ),
      ),
    );
  }
}
