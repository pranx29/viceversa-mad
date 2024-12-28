import 'package:flutter/material.dart';
import 'package:viceversa/common/widgets/layouts/grid_layout.dart';
import 'package:viceversa/common/widgets/shimmers/shimmer_effect.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VVerticalProductShimmer extends StatelessWidget {
  const VVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return VGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                VShimmerEffect(width: 180, height: 180),
                Positioned(
                  top: 8,
                  right: 8,
                  child: VShimmerEffect(
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
            SizedBox(height: VSizes.sm),

            // Details
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VShimmerEffect(width: 160, height: 15),
                SizedBox(height: VSizes.xs),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VShimmerEffect(width: 80, height: 15),
                    VShimmerEffect(width: 40, height: 15),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
