import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:viceversa/features/shop/screens/home/home_screen.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final isDarkTheme = VHelperFunctions.isDarkMode(context);

    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
              elevation: 0,
              backgroundColor:
                  isDarkTheme ? VColor.primary : VColor.primaryForeground,
              indicatorColor:
                  isDarkTheme ? VColor.secondary : VColor.secondaryForeground,
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              destinations: const [
                NavigationDestination(
                  icon: Icon(
                    LucideIcons.home,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(
                    LucideIcons.store,
                  ),
                  label: 'Store',
                ),
                NavigationDestination(
                  icon: Icon(
                    LucideIcons.heart,
                  ),
                  label: 'Wishlist',
                ),
                NavigationDestination(
                  icon: Icon(
                    LucideIcons.user,
                  ),
                  label: 'Profile',
                ),
              ]),
        ),
        body: Obx(
          () => controller.screens[controller.selectedIndex.value],
        ));
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const Center(
      child: const Text('Store'),
    ),
    const Center(
      child: const Text('Wishlist'),
    ),
    const Center(
      child: const Text('Profile'),
    ),
  ];
}
