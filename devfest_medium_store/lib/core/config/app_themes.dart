import 'package:flutter/material.dart';
import './app_texts.dart';
import 'app_colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.black),
    ),
    textTheme: AppText.lightThemeText,
    // colorScheme: AppColors.lightColorScheme,
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.black,
    textTheme: AppText.darkThemeText,
    // colorScheme: AppColors.darkColorScheme,
  );
}
