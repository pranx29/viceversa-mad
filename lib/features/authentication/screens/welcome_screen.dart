import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/common/widgets/navigation_menu.dart';
import 'package:viceversa/features/authentication/screens/login_screen.dart';
import 'package:viceversa/features/authentication/screens/register_screen.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/image_strings.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final List<String> imgList = [
    VImages.welcomeImage1,
    VImages.welcomeImage2,
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
        body: Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            enlargeCenterPage: false,
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            height: VHelperFunctions.screenHeight(),
          ),
          items: imgList
              .map((item) => Image.asset(
                    item,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ))
              .toList(),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  isDarkTheme
                      ? VColor.primary.withValues(alpha: 0)
                      : VColor.primaryForeground.withValues(alpha: 0),
                  isDarkTheme
                      ? VColor.primary.withValues(alpha: 0.2)
                      : VColor.primaryForeground.withValues(alpha: 0.2),
                  isDarkTheme
                      ? VColor.primary.withValues(alpha: 0.4)
                      : VColor.primaryForeground.withValues(alpha: 0.6),
                  isDarkTheme
                      ? VColor.primary.withValues(alpha: 0.8)
                      : VColor.primaryForeground.withValues(alpha: 0.8),
                  isDarkTheme
                      ? VColor.primary.withValues()
                      : VColor.primaryForeground.withValues(),
                ],
                stops: const [0.0, 0.3, 0.4, 0.5, 0.6],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Urban Essentials,\n",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    color: isDarkTheme
                                        ? VColor.primaryForeground
                                        : VColor.primary)),
                        TextSpan(
                            text: "Redefined for the Modern Minimalist.",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(
                                    color: isDarkTheme
                                        ? VColor.secondaryForeground
                                        : VColor.secondary)),
                        TextSpan(
                            text:
                                "\nDiscover timeless, minimalist pieces designed for urban life. "
                                "Shop our latest collection now.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: isDarkTheme
                                        ? VColor.secondaryForeground
                                        : VColor.secondary)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 16),
                      OutlinedButton(
                        onPressed: () {
                          Get.to(() => const RegisterScreen());
                        },
                        child: const Text('Register'),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () {
                          Get.to(() => const NavigationMenu());
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                        ),
                        child: const Text('Explore'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ]),
              )),
        ),
      ],
    ));
  }
}

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(VSizes.borderRadiusFull),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
