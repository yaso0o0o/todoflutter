import 'package:flutter/material.dart';
import 'package:flutter_application_1/news_app/core/theme/app_colors.dart';

class AppTheme {
  static final ThemeData _lightTheme = ThemeData(
    cardTheme: const CardTheme(
      color:  AppColors.tealColor,
        shadowColor: AppColors.blackColor
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.tealColor,
      ),
    ),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(
            backgroundColor: AppColors.whiteColor,
            selectedItemColor: AppColors.tealColor
        ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.blackColor),
    ),

  );
  static final ThemeData _darkTheme = ThemeData(
    cardTheme: const CardTheme(
      color: AppColors.purpleColor,
      shadowColor: AppColors.whiteColor ,
    ),
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blackColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.purpleColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
   bottomNavigationBarTheme:
         const BottomNavigationBarThemeData(
             backgroundColor: AppColors.blackColor,
             selectedItemColor: AppColors.purpleColor
         ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.whiteColor),
    ),
  );

  static ThemeData getLightTheme() => _lightTheme;

  static ThemeData getDarkTheme() => _darkTheme;
}
