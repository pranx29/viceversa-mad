import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/common/widgets/rounded_container.dart';
import 'package:viceversa/data/models/order_model.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({
    super.key,
    required this.onTap,
    required this.order,
  });

  final VoidCallback onTap;
  final Order order;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: VRoundedContainer(
        width: double.infinity,
        backgroundColor: Colors.transparent,
        borderWidth: 1,
        borderColor:
            isDarkTheme ? VColor.secondaryForeground : VColor.secondary,
        margin: const EdgeInsets.only(bottom: VSizes.spaceBtwItems),
        padding: VSizes.md,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.ship,
                  color: isDarkTheme
                      ? VColor.secondaryForeground
                      : VColor.secondary,
                ),
                const SizedBox(width: VSizes.spaceBtwItems / 2),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(order.status,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(fontWeightDelta: 1)),
                      Text(VHelperFunctions.getFormattedDate(order.date),
                          style: Theme.of(context).textTheme.headlineSmall),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Iconsax.arrow_right_34,
                      color: isDarkTheme
                          ? VColor.secondaryForeground
                          : VColor.secondary,
                    ))
              ],
            ),
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.tag,
                        color: isDarkTheme
                            ? VColor.secondaryForeground
                            : VColor.secondary,
                      ),
                      const SizedBox(width: VSizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Order',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(fontWeightDelta: 1)),
                            Text('#${order.id}',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Iconsax.calendar,
                        color: isDarkTheme
                            ? VColor.secondaryForeground
                            : VColor.secondary,
                      ),
                      const SizedBox(width: VSizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Shipping Date',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(fontWeightDelta: 1)),
                            Text(
                                VHelperFunctions.getFormattedDate(
                                    order.date.add(const Duration(days: 3))),
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
