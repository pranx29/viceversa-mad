import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VRoundedContainer extends StatelessWidget {
  const VRoundedContainer({
    super.key,
    this.width = 100,
    this.height = 100,
    this.padding = 0,
    this.margin,
    this.backgroundColor = VColor.primary,
    this.borderRadius = VSizes.md,
    this.child,
  });

  final double width;
  final double height;
  final double padding;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final double borderRadius;
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
      ),
      child: child,
    );
  }
}
