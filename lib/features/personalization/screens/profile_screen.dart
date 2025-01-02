
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = VHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: isDarkTheme ? VColor.primaryForeground : VColor.primary),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: isDarkTheme ? VColor.primaryForeground : VColor.primary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Information',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            VProfileMenu(
              title: 'First Name  ',
              value: 'Pranavan',
              onTap: () {},
            ),
            VProfileMenu(
              title: 'Last Name',
              value: 'Sivakumaran',
              onTap: () {},
            ),
            VProfileMenu(
              title: 'Email',
              value: 'pranx@vv.com',
              onTap: () {},
            ),
            const SizedBox(height: VSizes.spaceBtSections),
            const Divider(),
            const SizedBox(height: VSizes.spaceBtSections),
            Text(
              'Password',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            Text(
              'We advice you to change your password every 3 months for added security',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('Change Password'))),
            const SizedBox(height: VSizes.spaceBtSections),
            const Divider(),
            const SizedBox(height: VSizes.spaceBtSections),
            Text(
              'Sign out everywhere',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: VSizes.spaceBtwItems / 2),
            Text(
              'You will be signed out of all devices. You will need to sign in again with your password',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: VSizes.spaceBtwItems),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {}, child: const Text('Sign out everywhere'))),
          ],
        ),
      )),
    );
  }
}

class VProfileMenu extends StatelessWidget {
  final IconData icon;
  final String title, value;
  final VoidCallback onTap;

  const VProfileMenu({
    super.key,
    this.icon = Iconsax.arrow_right_34,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: VSizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(
                flex: 5,
                child: Text(value,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis)),
            const Icon(
              Iconsax.arrow_right_34,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
