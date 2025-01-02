import 'package:flutter/material.dart';
import 'package:viceversa/utils/constants/sizes.dart';

class VRoundedImage extends StatelessWidget {
  const VRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.image,
    this.borderRadius = VSizes.md,
    this.isNetwork = false,
    this.onTap,
  });

  final double? width, height;
  final String image;
  final bool isNetwork;
  final double borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: isNetwork
              ? Image.network(
                  image,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
