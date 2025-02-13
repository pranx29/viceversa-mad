import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';

/// A widget for displaying an animated loading indicator with optional text and action button.
class VAnimationLoaderWidget extends StatelessWidget {
  const VAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie.network(animation,
          //     width: MediaQuery.of(context).size.width *
          //         0.3), // Display Lottie animation
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width *
                  0.3), // Display Lottie animation
          const SizedBox(height: VSizes.defaultSpace),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: VColor.primaryForeground,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: VSizes.defaultSpace),
          if (showAction)
            SizedBox(
              width: 250,
              child: OutlinedButton(
                onPressed: onActionPressed,
                style:
                    OutlinedButton.styleFrom(backgroundColor: VColor.primary),
                child: Text(
                  actionText!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .apply(color: VColor.primaryForeground),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
