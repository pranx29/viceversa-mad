import 'package:flutter/material.dart';

class VProductPriceText extends StatelessWidget {
  const VProductPriceText({
    super.key,
    required this.price,
    this.currency = 'LKR',
    this.style,
  });

  final String price;
  final String currency;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$currency $price',
      style: style ?? Theme.of(context).textTheme.bodyLarge?.copyWith(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
