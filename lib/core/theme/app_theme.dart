import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    textTheme: GoogleFonts.robotoTextTheme(appTextTheme),
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.roboto(
        color: AppColors.yellow,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
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
  );

  static TextTheme appTextTheme = TextTheme(
    titleLarge: GoogleFonts.roboto(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    titleMedium: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: AppColors.white,
    ),
  );
}
