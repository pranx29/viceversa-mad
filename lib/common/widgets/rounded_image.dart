import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:viceversa/common/widgets/shimmers/shimmer_effect.dart';
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
    this.padding = EdgeInsets.zero,
    this.border,
    this.backgroundColor = Colors.transparent,
    this.imageBorder = true,
  });

  final double? width, height;
  final String image;
  final bool isNetwork;
  final double borderRadius;
  final VoidCallback? onTap;
  final EdgeInsets padding;
  final BoxBorder? border;
  final Color backgroundColor;
  final bool imageBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border,
        ),
        child: imageBorder
            ? ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: isNetwork
                    ? CachedNetworkImage(
                        imageUrl: image,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, _, downloadProgress) => VShimmerEffect(
                                width: width ?? double.infinity,
                                height: height ?? double.infinity),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
              )
            : (isNetwork
                ? CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )),
      ),
    );
  }
}
