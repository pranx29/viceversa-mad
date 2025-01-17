import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VGridLayout extends StatelessWidget {
  const VGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.mainAxisExtent = 310,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: mainAxisExtent,
          mainAxisSpacing: VSizes.gridViewSpacing,
          crossAxisSpacing: VSizes.gridViewSpacing),
      itemBuilder: itemBuilder,
    );
  }
}
