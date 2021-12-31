import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      colorScheme: const ColorScheme(
        primary: AppColors.primary,
        primaryVariant: AppColors.primaryDark,
        onPrimary: AppColors.primaryContrast,
        secondary: AppColors.accent,
        secondaryVariant: AppColors.accentDark,
        onSecondary: AppColors.accentContrast,
        background: AppColors.background,
        onBackground: AppColors.backgroundContrast,
        error: AppColors.error,
        onError: AppColors.errorContrast,
        brightness: Brightness.light,
        surface: AppColors.background,
        onSurface: AppColors.backgroundContrast
      )
    );
  }
}