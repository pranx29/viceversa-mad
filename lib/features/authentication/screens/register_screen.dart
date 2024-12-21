import 'package:flutter/material.dart';
import 'package:viceversa/features/authentication/controllers/login_controller.dart';
import 'package:viceversa/features/authentication/controllers/register_controller.dart';
import 'package:viceversa/features/authentication/screens/login_screen.dart';
import 'package:viceversa/utils/constants/image_strings.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:get/get.dart';
import 'package:viceversa/utils/validators/validation.dart';

// Register Screen
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = VHelperFunctions.isDarkMode(context);
    final controller = Get.put(RegisterController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: VSizes.defaultSpace,
            bottom: VSizes.defaultSpace,
            left: VSizes.defaultSpace,
            right: VSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo
              Image.asset(
                dark ? VImages.darkAppLogo : VImages.lightAppLogo,
                height: VHelperFunctions.screenHeight() * 0.1,
              ),
              const SizedBox(height: VSizes.sm),
              // Title & Subtitle
              Text(
                "Create Account",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: VSizes.sm),
              Text(
                "Join us and explore the latest fashion trends",
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              // Form
              Form(
                key: controller.registerFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: VSizes.spaceBtSections,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // First Name
                      TextFormField(
                        controller: controller.firstName,
                        validator: (value) =>
                            VValidator.validateEmptyText('First Name', value),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(LucideIcons.user),
                          labelText: 'First Name',
                          hintText: 'Enter your first name',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(VSizes.inputFieldRadius),
                          ),
                        ),
                      ),
                      const SizedBox(height: VSizes.spaceBtwInputFields),

                      // Last Name
                      TextFormField(
                        controller: controller.lastName,
                        validator: (value) =>
                            VValidator.validateEmptyText('Last Name', value),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(LucideIcons.user),
                          labelText: 'Last Name',
                          hintText: 'Enter your last name',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(VSizes.inputFieldRadius),
                          ),
                        ),
                      ),
                      const SizedBox(height: VSizes.spaceBtwInputFields),

                      // Email
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => VValidator.validateEmail(value),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(LucideIcons.mail),
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(VSizes.inputFieldRadius),
                          ),
                        ),
                      ),
                      const SizedBox(height: VSizes.spaceBtwInputFields),

                      // Password
                      Obx(
                        () => TextFormField(
                          controller: controller.password,
                          validator: (value) =>
                              VValidator.validatePassword(value),
                          obscureText: controller.hidePassword.value,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(LucideIcons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(controller.hidePassword.value
                                  ? LucideIcons.eye
                                  : LucideIcons.eyeOff),
                              onPressed: () => controller.hidePassword.value =
                                  !controller.hidePassword.value,
                            ),
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  VSizes.inputFieldRadius),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: VSizes.spaceBtwItems),

                      // Register Button
                      ElevatedButton(
                        onPressed: controller.register,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: VSizes.buttonHeight),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(VSizes.buttonRadius),
                          ),
                        ),
                        child: const Text(
                          'Register',
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Get.to(() => const LoginScreen());
                            },
                            child: const Text(
                              'Login',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
