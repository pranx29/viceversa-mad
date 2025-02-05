import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VSearchContainer extends StatelessWidget {
  const VSearchContainer({
    super.key,
    required this.onChanged,
  });

  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
        child: TextField(
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Iconsax.search_normal,
              color:
                  isDarkTheme ? VColor.secondaryForeground : VColor.secondary,
            ),
            hintText: 'Search for products',
            border: InputBorder.none,
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isDarkTheme
                    ? VColor.secondaryForeground
                    : VColor.secondary),
          ),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color:
                  isDarkTheme ? VColor.secondaryForeground : VColor.secondary),
        ),
      ),
    );
  }
}
