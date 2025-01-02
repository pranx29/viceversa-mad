import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/features/personalization/screens/settings_screen.dart';
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
              indicatorColor: isDarkTheme
                  ? VColor.primaryForeground.withValues(alpha: 0.1)
                  : VColor.primary.withValues(alpha: 0.1),
              selectedIndex: controller.selectedIndex.value,
              onDestinationSelected: (index) =>
                  controller.selectedIndex.value = index,
              destinations: [
                NavigationDestination(
                  icon: Obx(() => Icon(
                        controller.selectedIndex.value == 0
                            ? Iconsax.home_15
                            : Iconsax.home,
                      )),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Obx(() => Icon(
                        controller.selectedIndex.value == 1
                            ? Iconsax.shop5
                            : Iconsax.shop,
                      )),
                  label: 'Store',
                ),
                NavigationDestination(
                  icon: Obx(() => Icon(
                        controller.selectedIndex.value == 2
                            ? Iconsax.heart5
                            : Iconsax.heart,
                      )),
                  label: 'Wishlist',
                ),
                NavigationDestination(
                  icon: Obx(() => Icon(
                        controller.selectedIndex.value == 3
                            ? Iconsax.profile_tick5
                            : Iconsax.profile_tick,
                      )),
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
      child: Text('Store'),
    ),
    const Center(
      child: Text('Wishlist'),
    ),
    const Center(
      child: SettingsScreen(),
    ),
  ];
}
