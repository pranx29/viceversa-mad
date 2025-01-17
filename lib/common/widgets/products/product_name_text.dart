import 'package:flutter/material.dart';

class VProductNameText extends StatelessWidget {
  const VProductNameText({super.key, required this.name, this.style});

  final String name;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: style ?? Theme.of(context).textTheme.bodyLarge,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
