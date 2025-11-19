import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.white,
      onPrimary: AppColors.black,
      secondary: AppColors.yellow,
      onSecondary: AppColors.black,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.black,
      onSurface: AppColors.white,
    ),
    textTheme: appTextTheme,
  );

  static TextTheme appTextTheme = TextTheme(
    // displayLarge: ,
    // displayMedium: ,
    // displaySmall: ,
    // headlineLarge: ,
    // headlineMedium: ,
    // headlineSmall: ,
    titleLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    // titleSmall: ,
    // bodyLarge: ,
    bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    // bodySmall: ,
    // labelLarge: ,
    // labelMedium: ,
    // labelSmall: ,
  );
}
