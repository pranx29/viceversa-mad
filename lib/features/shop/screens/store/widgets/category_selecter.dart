import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/common/widgets/circular_image_text.dart';
import 'package:viceversa/common/widgets/shimmers/category_shimmer.dart';
import 'package:viceversa/features/shop/controllers/category_controller.dart';
import 'package:viceversa/features/shop/controllers/product_controller.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VCategories extends StatelessWidget {
  const VCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final productController = Get.find<ProductController>();
    Rx<int> selectedCategory = 0.obs;

    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Category", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: VSizes.spaceBtwItems),
          // Category List
          controller.isLoading.value
              ? const VCategoriesShimmer(
                  itemCount: 5,
                )
              : controller.allCategories.isEmpty
                  ? const Center(
                      child: Text("No Categories Found"),
                    )
                  : SizedBox(
                      height: 90,
                      child: ListView.builder(
                        itemCount: controller.allCategories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          final category = controller.allCategories[index];
                          return VCircularImageText(
                            image: category.image,
                            title: category.name,
                            isNetworkImage: true,
                            onTap: () {
                              selectedCategory.value = category.id;
                              productController.fetchProductsByCategoryId(
                                selectedCategory.value,
                              );
                            },
                          );
                        },
                      ),
                    ),
          Obx(() {
            return selectedCategory.value != 0
                ? TextButton(
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      productController.fetchAllProducts();
                      selectedCategory.value = 0;
                    },
                    child: const Text("View All"),
                  )
                : const SizedBox(
                    height: VSizes.spaceBtwItems,
                  );
          }),
        ],
      );
    });
  }
}
