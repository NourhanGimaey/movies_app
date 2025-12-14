import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.white,
      onPrimary: AppColors.black,
      secondary: AppColors.yellow,
      onSecondary: AppColors.black,
      primaryContainer: AppColors.grey,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.black,
      onSurface: AppColors.white,
    ),
    textTheme: appTextTheme,
  );

  static TextTheme appTextTheme = const TextTheme(
    // displayLarge: ,
    // displayMedium: ,
    // displaySmall: ,
    // headlineLarge: ,
    // headlineMedium: ,
    // headlineSmall: ,
    titleLarge: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
    titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
    // titleSmall: ,
    // bodyLarge: ,
    bodyMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    bodySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    // labelLarge: ,
    // labelMedium: ,
    // labelSmall: ,
  );
}
