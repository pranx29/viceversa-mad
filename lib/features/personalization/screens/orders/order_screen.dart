import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/features/personalization/controllers/order_controller.dart';
import 'package:viceversa/features/personalization/screens/orders/widgets/order_container.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    final orderController = Get.put(OrderController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: isDarkTheme ? VColor.primaryForeground : VColor.primary),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                if (orderController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: isDarkTheme
                          ? VColor.primaryForeground
                          : VColor.primary,
                    ),
                  );
                }
                return orderController.orders.isEmpty
                    ? Center(
                        child: Text('No orders yet',
                            style: Theme.of(context).textTheme.bodyMedium))
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: orderController.orders.length,
                        itemBuilder: (context, index) {
                          return OrderContainer(
                            order: orderController.orders[index],
                            onTap: () {},
                          );
                        },
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
