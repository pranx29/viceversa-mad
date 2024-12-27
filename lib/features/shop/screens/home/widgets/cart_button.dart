import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VCartCountIconButton extends StatelessWidget {
  const VCartCountIconButton({
    super.key,
    required this.onPressed,
    required this.isDarkTheme,
  });

  final bool isDarkTheme;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
      child: Stack(
        children: [
          IconButton(
            icon: const Icon(LucideIcons.shoppingBag),
            onPressed: () {},
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: isDarkTheme
                      ? VColor.primaryForeground.withAlpha(200)
                      : VColor.primary.withAlpha(200),
                  borderRadius: BorderRadius.circular(VSizes.borderRadiusFull)),
              child: Center(
                  child: Text('2',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: isDarkTheme
                              ? VColor.primary
                              : VColor.primaryForeground))),
            ),
          )
        ],
      ),
    );
  }
}
