import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/device/device_utility.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VSearchContainer extends StatelessWidget {
  const VSearchContainer({
    super.key,
    required this.onTap,
  });

  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
        child: Container(
          width: VDeviceUtils.getScreenWidth(),
          padding: const EdgeInsets.all(VSizes.md),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(VSizes.cardRadiusLg),
            border: Border.all(
                color:
                    isDarkTheme ? VColor.secondaryForeground : VColor.secondary,
                width: 1),
          ),
          child: Row(
            children: [
              Icon(
                LucideIcons.search,
                color:
                    isDarkTheme ? VColor.secondaryForeground : VColor.secondary,
              ),
              const SizedBox(width: VSizes.spaceBtwItems),
              Text(
                'Search for products',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDarkTheme
                        ? VColor.secondaryForeground
                        : VColor.secondary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
