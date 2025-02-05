import 'package:flutter/material.dart';
import 'package:viceversa/common/widgets/shimmers/shimmer_effect.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VCategoriesShimmer extends StatelessWidget {
  const VCategoriesShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: VSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 90,
            child: ListView.builder(
                itemCount: itemCount,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return const Padding(
                    padding: EdgeInsets.only(right: VSizes.spaceBtwItems),
                    child: Column(
                      children: [
                        VShimmerEffect(
                          height: 60,
                          width: 60,
                          radius: VSizes.borderRadiusFull,
                        ),
                        SizedBox(height: VSizes.spaceBtwItems / 2),
                        VShimmerEffect(
                          height: 20,
                          width: 50,
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
