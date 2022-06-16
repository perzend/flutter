import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

ThemeData darkTheme = ThemeData(
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
  scaffoldBackgroundColor: AppColors.neutral90,
  fontFamily: 'Poppins',
  textTheme: TextTheme(
    headline1: AppTextStyle.h1.copyWith(color: AppColors.white),
    headline2: AppTextStyle.h2.copyWith(color: AppColors.white),
    headline3: AppTextStyle.h3.copyWith(color: AppColors.white),
    headline4: AppTextStyle.h4.copyWith(color: AppColors.white),
    headline5: AppTextStyle.h5.copyWith(color: AppColors.white),
    bodyText1: AppTextStyle.bodyText1.copyWith(color: AppColors.white),
    bodyText2: AppTextStyle.bodyText2.copyWith(color: AppColors.neutral10),
    caption: AppTextStyle.caption.copyWith(color: AppColors.neutral10),
    overline: AppTextStyle.overline.copyWith(color: AppColors.neutral10),
  ),
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.neutral90,
        statusBarIconBrightness: Brightness.light),
    backgroundColor: AppColors.neutral90,
    foregroundColor: AppColors.white,
    elevation: 0,
    titleTextStyle: AppTextStyle.bodyText1,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all<Color>(AppColors.neutral70),
    trackColor: MaterialStateProperty.all<Color>(AppColors.neutral10),
  ),
);
