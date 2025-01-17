import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/common/widgets/rounded_container.dart';
import 'package:viceversa/common/widgets/rounded_image.dart';
import 'package:viceversa/data/models/product_image_model.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({super.key, required this.images});

  final List<ProductImage> images;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    final selectedImage = images.first.obs;

    return VRoundedContainer(
      height: VHelperFunctions.screenHeight() * 0.5,
      width: double.infinity,
      child: Container(
        color: VColor.productBackground,
        child: Stack(children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(bottom: VSizes.spaceBtwItems),
              child: Center(
                  child: Obx(
                () => CachedNetworkImage(
                  imageUrl: selectedImage.value.path,
                  fit: BoxFit.contain,
                  progressIndicatorBuilder: (context, url, progress) =>
                      CircularProgressIndicator(value: progress.progress),
                ),
              )),
            ),
          ),

          Positioned(
            right: VSizes.defaultSpace,
            bottom: VSizes.spaceBtwItems,
            left: VSizes.defaultSpace,
            child: VRoundedContainer(
              backgroundColor:
                  isDarkTheme ? VColor.primary : VColor.primaryForeground,
              padding: VSizes.sm,
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: images.length,
                itemBuilder: (context, index) => Obx(() {
                  return VRoundedImage(
                    onTap: () => {
                      selectedImage.value = images[index],
                    },
                    imageBorder: false,
                    width: 60,
                    borderRadius: VSizes.sm,
                    padding: const EdgeInsets.symmetric(horizontal: VSizes.sm),
                    border: Border.all(
                        color: isDarkTheme
                            ? VColor.primaryForeground
                            : VColor.primary,
                        width: selectedImage.value == images[index] ? 2 : 0.5),
                    image: images[index].path,
                    isNetwork: true,
                  );
                }),
                separatorBuilder: (context, index) =>
                    const SizedBox(width: VSizes.spaceBtwItems),
              ),
            ),
          )

          // Image Slider
        ]),
      ),
    );
  }
}
