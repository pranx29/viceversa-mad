import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VRoundedContainer extends StatelessWidget {
  const VRoundedContainer({
    super.key,
    this.width = 100,
    this.height,
    this.padding = 0,
    this.margin,
    this.backgroundColor = VColor.primary,
    this.borderRadius = VSizes.md,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.child,
  });

  final double width;
  final double? height;
  final double padding;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
        border: Border.all(color: borderColor, width: borderWidth),
      ),
      child: child,
    );
  }
}
