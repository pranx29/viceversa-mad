import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VCircularIconButton extends StatelessWidget {
  const VCircularIconButton({
    super.key,
    required this.icon,
    this.height,
    this.width,
    this.size = VSizes.lg,
    this.iconColor,
    this.backgroundColor,
    this.onPressed,
  });

  final double? height, width, size;
  final IconData? icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = VHelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(VSizes.borderRadiusFull),
        color: backgroundColor ??
            (isDarkTheme
                ? VColor.primary.withValues(alpha: 0.5)
                : VColor.primaryForeground.withValues(alpha: 0.5)),
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor),
        iconSize: size,
        onPressed: onPressed ?? () {},
      ),
    );
  }
}
