import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';
import 'package:viceversa/utils/popups/animation_loader.dart';

class VTFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context:
          Get.overlayContext!, // Use Get.overlayContext for overlay dialogs
      barrierDismissible:
          false, // The dialog can't be dismissed by tapping outside it
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: VHelperFunctions.isDarkMode(Get.context!)
              ? VColor.primary
              : VColor.primary,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250), // Adjust the spacing as needed
              VAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static closeLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
