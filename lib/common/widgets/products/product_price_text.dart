import 'package:flutter/material.dart';

class VProductPriceText extends StatelessWidget {
  const VProductPriceText({
    super.key,
    required this.price,
    this.currency = 'LKR',
    this.lineThrough = false,
    this.style,
  });

  final String price;
  final String currency;
  final bool lineThrough;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$currency $price',
      style: style ?? Theme.of(context).textTheme.bodyLarge?.copyWith(
            decoration: lineThrough ? TextDecoration.lineThrough : null,
          ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

