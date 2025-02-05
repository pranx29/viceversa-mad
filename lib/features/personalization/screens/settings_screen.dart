import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/common/widgets/rounded_image.dart';
import 'package:viceversa/features/authentication/screens/login_screen.dart';
import 'package:viceversa/features/authentication/screens/register_screen.dart';
import 'package:viceversa/features/personalization/controllers/user_controller.dart';
import 'package:viceversa/features/personalization/screens/address/address_screen.dart';
import 'package:viceversa/features/personalization/screens/orders/order_screen.dart';
import 'package:viceversa/features/personalization/screens/profile/profile_screen.dart';
import 'package:viceversa/features/personalization/widgets/setting_menu_tile.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    final controller = UserController.instance;

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
        // actions: [
        //   VCartCountIconButton(
        //       onPressed: () => {Get.to(() => const CartScreen())})
        // ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: VSizes.defaultSpace),
        child: Center(
          child: controller.user.value.id != 0
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const VRoundedImage(
                        height: 50,
                        width: 50,
                        image:
                            'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg',
                        isNetwork: true,
                        borderRadius: VSizes.borderRadiusFull,
                      ),
                      title: Text(
                          '${controller.user.value.firstName} ${controller.user.value.lastName}'),
                      subtitle: Text(controller.user.value.email),
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
                        onTap: () {
                          Get.to(() => const AddressScreen());
                        }),
                    VSettingMenuTile(
                        icon: Iconsax.bag_tick,
                        title: 'My Orders',
                        subtitle: 'Track your orders',
                        onTap: () {
                          Get.to(() => const OrderScreen());
                        }),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Create an account to access your profile'),
                    const SizedBox(height: VSizes.spaceBtwItems),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Get.to(() => const RegisterScreen());
                          },
                          child: const Text('Register'),
                        ),
                        const SizedBox(width: VSizes.spaceBtwItems),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(() => const LoginScreen());
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
