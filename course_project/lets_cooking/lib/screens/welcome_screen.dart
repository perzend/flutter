import 'package:flutter/material.dart';
import 'package:lets_cooking/constants/text_style.dart';

import '../constants/colors.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const routeName = '/WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.neutral90,
          body: Stack(alignment: Alignment.center, children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcome_screen_bg.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 26.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: AppColors.white),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '60k+',
                      style: AppTextStyle.bodyText1.copyWith(
                          fontWeight: FontWeight.bold, color: AppColors.white),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      'Premium recipes',
                      style: AppTextStyle.bodyText1
                          .copyWith(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Let\'s\nCooking',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.heading.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.white),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'Find best recipes for cooking',
                    textAlign: TextAlign.center,
                    style:
                        AppTextStyle.bodyText1.copyWith(color: AppColors.white),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, HomeScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primary50,
                      fixedSize: const Size(206, 54),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Start cooking',
                          style: AppTextStyle.bodyText1.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.white),
                        ),
                        const Icon(Icons.arrow_forward_outlined),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                ],
              ),
            ),
          ])),
    );
  }
}
