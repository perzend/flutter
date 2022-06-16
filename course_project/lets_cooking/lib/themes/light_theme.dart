import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

ThemeData lightTheme = ThemeData(
  tabBarTheme: TabBarTheme(
    labelStyle: AppTextStyle.caption.copyWith(
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: AppTextStyle.caption.copyWith(
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelColor: AppColors.primary30,
    labelColor: AppColors.white,
    indicator: BoxDecoration(
        color: AppColors.primary50, borderRadius: BorderRadius.circular(10.0)),
  ),
  scaffoldBackgroundColor: AppColors.white,
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    headline1: AppTextStyle.h1.copyWith(color: AppColors.neutral90),
    headline2: AppTextStyle.h2.copyWith(color: AppColors.neutral90),
    headline3: AppTextStyle.h3.copyWith(color: AppColors.neutral90),
    headline4: AppTextStyle.h4.copyWith(color: AppColors.neutral90),
    headline5: AppTextStyle.h5.copyWith(color: AppColors.neutral90),
    bodyText1: AppTextStyle.bodyText1.copyWith(color: AppColors.neutral90),
    bodyText2: AppTextStyle.bodyText2.copyWith(color: AppColors.neutral30),
    caption: AppTextStyle.caption.copyWith(color: AppColors.neutral30),
    overline: AppTextStyle.overline.copyWith(color: AppColors.neutral30),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark),
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.neutral90,
    elevation: 0,
    titleTextStyle: AppTextStyle.bodyText1,
  ),
);
