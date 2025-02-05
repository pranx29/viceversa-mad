import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/common/widgets/layouts/grid_layout.dart';
import 'package:viceversa/common/widgets/products/product_card_vertical.dart';
import 'package:viceversa/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:viceversa/features/personalization/controllers/user_controller.dart';
import 'package:viceversa/features/shop/controllers/home_controller.dart';
import 'package:viceversa/features/shop/controllers/product_controller.dart';
import 'package:viceversa/features/shop/screens/cart/cart_screen.dart';
import 'package:viceversa/features/shop/screens/home/widgets/banner_slider.dart';
import 'package:viceversa/features/shop/screens/home/widgets/cart_button.dart';
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
    final userController = Get.put(UserController());
    final HomeController homeController = Get.put(HomeController());

    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(VSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  homeController.getBatteryMessage(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isDarkTheme
                          ? VColor.primaryForeground
                          : VColor.primary),
                ),
                Obx(() {
                  return RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${VHelperFunctions.getGreetingMessage()}, ',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  color: isDarkTheme
                                      ? VColor.secondaryForeground
                                      : VColor.secondary),
                        ),
                        TextSpan(
                          text: userController.user.value.firstName.isNotEmpty
                              ? userController.user.value.firstName
                              : 'Guest',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: isDarkTheme
                                      ? VColor.primaryForeground
                                      : VColor.primary),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
          actions: [
            VCartCountIconButton(
                onPressed: () => {Get.to(() => const CartScreen())})
          ],
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(VSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: VSizes.spaceBtSections),
                // Banners
                const VBannerSlider(
                  banners: [VImages.banner1, VImages.banner2, VImages.banner3],
                ),

                const SizedBox(height: VSizes.spaceBtSections),

                // Best  Products
                Obx(() {
                  if (controller.isLoading.value) {
                    return const VVerticalProductShimmer();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Best Sellers",
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: VSizes.spaceBtwItems),
                      if (controller.bestSellerProducts.isEmpty)
                        Center(
                            child: Text('No Products Found',
                                style: Theme.of(context).textTheme.bodyMedium)),
                      if (controller.bestSellerProducts.isNotEmpty)
                        // Products Grid
                        VGridLayout(
                            itemCount: controller.bestSellerProducts.length,
                            itemBuilder: (_, index) => VProductCardVertical(
                                product: controller.bestSellerProducts[index]))
                    ],
                  );
                }),
                const SizedBox(height: VSizes.spaceBtSections),
                // Exclusive Offers
                Obx(() {
                  if (controller.isLoading.value) {
                    return const VVerticalProductShimmer();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Exclusive Offers",
                          style: Theme.of(context).textTheme.headlineMedium),
                      const SizedBox(height: VSizes.spaceBtwItems),
                      if (controller.discountedProducts.isEmpty)
                        Center(
                            child: Text('No Products Found',
                                style: Theme.of(context).textTheme.bodyMedium)),
                      if (controller.discountedProducts.isNotEmpty)
                        // Products Grid
                        VGridLayout(
                            itemCount: controller.discountedProducts.length,
                            itemBuilder: (_, index) => VProductCardVertical(
                                product: controller.discountedProducts[index]))
                    ],
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
