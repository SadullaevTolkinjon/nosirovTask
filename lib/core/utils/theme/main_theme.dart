import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/color/color_const.dart';

class MainTheme {
  static ThemeData light = ThemeData(
    // ? FontFamily

    fontFamily: "Gilroy",
    textTheme: TextTheme(
      bodySmall: TextStyle(fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontWeight: FontWeight.w500), // Medium
      bodyLarge: TextStyle(fontWeight: FontWeight.w700), // Bold
    ),
    // ? Elevated Buttons Style

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        textStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
    ),
// ? FloatingAction Button style
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: AppColors.blue,
      extendedTextStyle: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    ),
    // ? Appbars Style

    appBarTheme: AppBarTheme(
      foregroundColor: AppColors.black,
      backgroundColor: AppColors.white,
      elevation: 2,
      titleTextStyle: TextStyle(
          fontSize: 18.sp, fontWeight: FontWeight.w600, color: AppColors.black),
    ),

    // ? Scaffold background Color
    scaffoldBackgroundColor: AppColors.white,
    // ? Floating action Buttons styles
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blue,
      unselectedItemColor: AppColors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}
