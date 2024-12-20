import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viceversa/features/authentication/screens/login_screen.dart';
import 'package:viceversa/utils/constants/colors.dart';
import 'package:viceversa/utils/constants/image_strings.dart';
import 'package:viceversa/utils/constants/sizes.dart';
import 'package:viceversa/utils/helpers/helper_functions.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final List<String> imgList = [
    VImages.welcomeImage1,
    VImages.welcomeImage2,
    VImages.welcomeImage3,
    VImages.welcomeImage4,
  ];

  @override
  Widget build(BuildContext context) {
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
                  VColor.primary.withOpacity(0.1),
                  VColor.primary.withOpacity(0.4),
                  VColor.primary.withOpacity(0.6),
                  VColor.primary.withOpacity(0.8),
                  VColor.primary.withOpacity(1),
                ],
                stops: const [0.0, 0.3, 0.4, 0.5, 0.7],
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
                            text: "Style Redefined: ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: VColor.secondaryForeground)),
                        TextSpan(
                            text: "Trendy Fashion Wardrobe",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: VColor.primaryForeground)),
                        TextSpan(
                            text:
                                "\nExplore your style with our chic, versatile essentials and trends.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: VColor.primaryForeground))
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        child: const Text('Login'),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Register'),
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
