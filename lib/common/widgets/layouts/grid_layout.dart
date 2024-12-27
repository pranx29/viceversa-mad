import 'package:flutter/material.dart';

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
        mainAxisSpacing:
            8.0, // Replace TSizes.gridViewSpacing with a fixed value or import TSizes
        crossAxisSpacing:
            8.0, // Replace TSizes.gridViewSpacing with a fixed value or import TSizes
      ),
      itemBuilder: itemBuilder,
    );
  }
}
