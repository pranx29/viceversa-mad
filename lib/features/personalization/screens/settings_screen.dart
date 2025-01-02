import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/common/widgets/rounded_image.dart';
import 'package:viceversa/features/personalization/screens/profile_screen.dart';
import 'package:viceversa/features/personalization/widgets/setting_menu_tile.dart';
import 'package:viceversa/features/shop/screens/home/widgets/cart_button.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: VSizes.md),
          child: Text(
            'Account',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: isDarkTheme ? VColor.primaryForeground : VColor.primary),
          ),
        ),
        actions: [
          VCartCountIconButton(onPressed: () => {}, isDarkTheme: isDarkTheme)
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: VRoundedImage(
                height: 50,
                width: 50,
                image:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuNhTZJTtkR6b-ADMhmzPvVwaLuLdz273wvQ&s',
                isNetwork: true,
                borderRadius: VSizes.borderRadiusFull,
              ),
              title: Text('Pranavan'),
              subtitle: Text('pranx@vv.com'),
            ),
            const SizedBox(height: VSizes.spaceBtSections),
            Text(
              'Account Settings',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            VSettingMenuTile(
                icon: Iconsax.user,
                title: 'My Profile',
                subtitle: 'Edit you personal information',
                onTap: () {
                  Get.to(() => const ProfileScreen());
                }),
            VSettingMenuTile(
                icon: Iconsax.safe_home,
                title: 'My Addresses',
                subtitle: 'Set your delivery addresses',
                onTap: () {}),
            VSettingMenuTile(
                icon: Iconsax.bag_tick,
                title: 'My Orders',
                subtitle: 'Track your orders',
                onTap: () {}),
          ],
        )),
      ),
    );
  }
}
