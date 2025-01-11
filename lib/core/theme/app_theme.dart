import 'package:flutter/material.dart';
import 'package:space/core/assets/app_colors.dart';


class AppTheme {
  static ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              elevation: 0)));
}
