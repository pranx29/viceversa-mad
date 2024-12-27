import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VCircularImageText extends StatelessWidget {
  const VCircularImageText({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });

  final String image, title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDarkTheme = VHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: VSizes.spaceBtwItems),
        child: Column(children: [
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(VSizes.sm),
            decoration: BoxDecoration(
                color: isDarkTheme ? VColor.primaryForeground : VColor.primary,
                borderRadius: BorderRadius.circular(VSizes.borderRadiusFull)),
            child: Center(
                child: Image(
              image: AssetImage(image),
              fit: BoxFit.cover,
              color: isDarkTheme ? VColor.primary : VColor.primaryForeground,
            )),
          ),
          const SizedBox(height: VSizes.spaceBtwItems / 2),
          SizedBox(
            width: 50,
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color:
                        isDarkTheme ? VColor.primaryForeground : VColor.primary,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ]),
      ),
    );
  }
}
