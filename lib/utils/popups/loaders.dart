import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:viceversa/utils/constants/colors.dart';

class VLoaders {
  static void warningSnackBar({required String title, String? message}) {
    Get.snackbar(
      title,
      message ?? '',
      isDismissible: true,
      shouldIconPulse: true,
      colorText: VColor.primaryForeground,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(8),
      icon: const Icon(LucideIcons.alertTriangle, color: Colors.white),
    );
  }

  static void errorSnackBar({required String title, String? message}) {
    Get.snackbar(
      title,
      message ?? '',
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(8),
      icon: const Icon(LucideIcons.alertTriangle, color: Colors.white),
    );
  }

  static void successSnackBar({required String title, String? message}) {
    Get.snackbar(
      title,
      message ?? '',
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.green.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(8),
      icon: const Icon(LucideIcons.check, color: Colors.white),
    );
  }
  
  static void toastMessage({required String message}) {
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      margin: const EdgeInsets.all(8),
      borderRadius: 8,
      duration: const Duration(seconds: 2),
    );
  }
}
