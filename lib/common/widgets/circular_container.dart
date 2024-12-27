import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VCircularContainer extends StatelessWidget {
  const VCircularContainer({
    super.key,
    this.width = 100,
    this.height = 100,
    this.padding = 0,
    this.margin,
    this.backgroundColor = VColor.primary,
    this.child,
  });

  final double width;
  final double height;
  final double padding;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(VSizes.borderRadiusFull),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
