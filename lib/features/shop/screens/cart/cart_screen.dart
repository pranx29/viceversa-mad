import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/features/shop/controllers/cart_controller.dart';
import 'package:viceversa/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
        appBar: AppBar(
          title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
        ),
        body: Padding(
            padding: const EdgeInsets.all(VSizes.defaultSpace),
            child: Obx(() {
              if (controller.cartItems.isEmpty) {
                return Center(
                  child: Text(
                    'Your cart is empty',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                );
              } else {
                return ListView.separated(
                    itemBuilder: (_, index) => Column(
                          children: [
                            VCartItem(
                              item: controller.cartItems[index],
                            ),
                          ],
                        ),
                    separatorBuilder: (_, __) => const SizedBox(
                          height: VSizes.spaceBtwItems,
                        ),
                    itemCount: controller.cartItems.length);
              }
            })),
        bottomNavigationBar: Obx(() {
          if (controller.cartItems.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(VSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Checkout LKR ${controller.totalAmount}')),
            );
          } else {
            return const SizedBox.shrink();
          }
        }));
  }
}
