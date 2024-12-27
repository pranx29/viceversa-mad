import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VRoundedImage extends StatelessWidget {
  const VRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.image,
    this.onTap,
  });

  final double? width, height;
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(VSizes.md),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(VSizes.md),
          child: Image(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
