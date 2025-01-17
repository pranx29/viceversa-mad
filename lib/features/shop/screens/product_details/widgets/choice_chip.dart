import 'package:flutter/material.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class VChoiceChip extends StatelessWidget {
  const VChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: onSelected,
    );
  }
}