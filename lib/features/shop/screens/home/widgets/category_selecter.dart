import 'package:flutter/material.dart';
import 'package:viceversa/common/widgets/circular_image_text.dart';
import 'package:viceversa/utils/constants/image_strings.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VCategories extends StatelessWidget {
  const VCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: VSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Category", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: VSizes.spaceBtwItems),
          SizedBox(
            height: 90,
            child: ListView.builder(
                itemCount: 6,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return VCircularImageText(
                      image: VImages.tshirtIcon, title: 'T-Shirt', onTap: () {});
                }),
          )
        ],
      ),
    );
  }
}
