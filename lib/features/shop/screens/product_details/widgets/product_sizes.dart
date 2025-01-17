import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/data/models/product_model.dart';
import 'package:viceversa/features/shop/controllers/cart_controller.dart';
import 'package:viceversa/features/shop/screens/product_details/widgets/choice_chip.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VProductSizes extends StatelessWidget {
  VProductSizes({
    super.key,
    required this.product,
  });

  final Product product;
  final RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.selectedSize = product.sizes.first.name.obs;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Sizes', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: VSizes.spaceBtwItems / 2),
        SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: product.sizes.length,
              itemBuilder: (context, index) {
                final size = product.sizes[index];
                return Obx(() => VChoiceChip(
                      label: size.name,
                      selected: selectedIndex.value == index,
                      onSelected: (value) {
                        selectedIndex.value = index;
                        controller.selectedSize.value = size.name;
                      },
                    ));
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(width: VSizes.spaceBtwItems / 2),
            )),
      ],
    );
  }
}
