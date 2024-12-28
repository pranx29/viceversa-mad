import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/common/widgets/layouts/grid_layout.dart';
import 'package:viceversa/common/widgets/products/product_card_vertical.dart';
import 'package:viceversa/common/widgets/search_bar.dart';
import 'package:viceversa/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:viceversa/features/shop/controllers/product_controller.dart';
import 'package:viceversa/features/shop/screens/home/widgets/banner_slider.dart';
import 'package:viceversa/features/shop/screens/home/widgets/cart_button.dart';
import 'package:viceversa/features/shop/screens/home/widgets/category_selecter.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/image_strings.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    final controller = Get.put(ProductController());


    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: VSizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Morning,',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: isDarkTheme
                            ? VColor.secondaryForeground
                            : VColor.secondary)),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: isDarkTheme
                          ? VColor.primaryForeground
                          : VColor.primary),
                ),
              ],
            ),
          ),
          actions: [
            VCartCountIconButton(onPressed: () => {}, isDarkTheme: isDarkTheme)
          ],
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              const SizedBox(height: VSizes.spaceBtSections),
              VSearchContainer(onTap: () {}),

              const SizedBox(height: VSizes.spaceBtSections),
              // Banners
              const VBannerSlider(
                banners: [VImages.banner1, VImages.banner2],
              ),

              // Categories
              const SizedBox(height: VSizes.spaceBtSections),
              const VCategories(),

              // Best  Products
              Obx(() {
                if (controller.isLoading.value) {
                  return const VVerticalProductShimmer();
                }
                if (controller.bestSellerProducts.isEmpty) {
                  return Center(
                      child: Text('No Products Found',
                          style: Theme.of(context).textTheme.bodyMedium));
                }
                return Padding(
                  padding: const EdgeInsets.all(VSizes.defaultSpace),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Best Sellers",
                            style: Theme.of(context).textTheme.headlineSmall),
                        const SizedBox(height: VSizes.spaceBtwItems),

                        // Products Grid
                        VGridLayout(
                            itemCount: controller.bestSellerProducts.length,
                            itemBuilder: (_, index) => VProductCardVertical(
                                product: controller.bestSellerProducts[index]))
                      ]),
                );
              }) // Add a default return widget
            ],
          ),
        ));
  }
}
