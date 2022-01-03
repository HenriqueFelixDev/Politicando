import 'package:flutter/material.dart';

import '../theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      textTheme: TextTheme(
        headline1: AppTextStyles.heading1,
        headline2: AppTextStyles.heading2,
        headline3: AppTextStyles.heading3,
        headline4: AppTextStyles.heading4,
        headline5: AppTextStyles.heading5,
        headline6: AppTextStyles.heading6,
        bodyText1: AppTextStyles.body,
        bodyText2: AppTextStyles.bodyAlternative,
        subtitle1: AppTextStyles.subtitle
      ),
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