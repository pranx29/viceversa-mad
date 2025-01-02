import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/common/widgets/circular_image_text.dart';
import 'package:viceversa/common/widgets/shimmers/category_shimmer.dart';
import 'package:viceversa/features/shop/controllers/category_controller.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VCategories extends StatelessWidget {
  const VCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(left: VSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Category", style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: VSizes.spaceBtwItems),

            // Category List
            controller.isLoading.value
                ? const VCategoriesShimmer()
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
                              onTap: () {},
                            );
                          },
                        ),
                      ),
          ],
        ),
      );
    });
  }
}
