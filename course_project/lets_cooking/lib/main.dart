import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lets_cooking/constants/colors.dart';
import 'package:lets_cooking/screens/home_screen.dart';
import 'package:lets_cooking/screens/recipe_details_screen.dart';

import 'constants/text_style.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        tabBarTheme: TabBarTheme(
          labelStyle: AppTextStyle.small.copyWith(
              fontWeight: FontWeight.bold,),
          unselectedLabelStyle: AppTextStyle.small.copyWith(
              fontWeight: FontWeight.bold,),
          unselectedLabelColor: AppColors.primary30,
          labelColor: AppColors.white,
          indicator: BoxDecoration(color:AppColors.primary50, borderRadius: BorderRadius.circular(10.0)),
          //indicatorSize: TabBarIndicatorSize.tab,
         //labelPadding: EdgeInsets.symmetric( horizontal: 6.0)

        ),

        primarySwatch: Colors.blue,
        backgroundColor: AppColors.white,
        scaffoldBackgroundColor: AppColors.white,
        fontFamily: 'Poppins',
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: AppColors.white),
          backgroundColor: AppColors.white,
          elevation: 0,
        )
      ),
      home: const HomeScreen()
      );

  }
}
