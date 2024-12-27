import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:viceversa/common/widgets/circular_container.dart';
import 'package:viceversa/common/widgets/rounded_image.dart';
import 'package:viceversa/features/shop/controllers/home_controller.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';


class VBannerSlider extends StatelessWidget {
  const VBannerSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
      child: Column(
        children: [
          CarouselSlider(
              items: [
                for (int i = 0; i < 2; i++)
                  VRoundedImage(
                    image: banners[i],
                  ),
              ],
              options: CarouselOptions(
                viewportFraction: 1,
                height: VHelperFunctions.screenHeight() * 0.2,
                onPageChanged: (index, _) =>
                    controller.onCarouselPageChanged(index),
              )),
          const SizedBox(height: VSizes.spaceBtwItems),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < banners.length; i++)
                  VCircularContainer(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: VSizes.sm),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? VColor.secondary
                        : VColor.secondaryForeground,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
