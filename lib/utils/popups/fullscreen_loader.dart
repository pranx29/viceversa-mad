import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/utils/constants/colors.dart';
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
          color: VColor.primary.withValues(alpha: 0.8),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  static closeLoadingDialog() {
    Navigator.of(Get.context!).canPop();
  }
}
