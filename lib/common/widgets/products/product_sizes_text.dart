import 'package:flutter/material.dart';

class VProductSizesText extends StatelessWidget {
  const VProductSizesText({
    super.key,
    required this.sizes,
  });

  final int sizes;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$sizes Sizes',
      style: Theme.of(context).textTheme.labelMedium,
    );
  }
}
