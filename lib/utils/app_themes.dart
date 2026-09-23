import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

enum ThemeType { normal, germany, mexico }

class AppThemes {
  static ThemeData getTheme(ThemeType themeType) {
    final baseTextStyle = GoogleFonts.chicle(
      color: AppColors.textDark,
    );

    final colorScheme = _getColorScheme(themeType);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        displayLarge: baseTextStyle.copyWith(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: baseTextStyle.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
        titleLarge: baseTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w600),
        bodyLarge: baseTextStyle.copyWith(fontSize: 16),
        bodyMedium: baseTextStyle.copyWith(fontSize: 14),
        bodySmall: baseTextStyle.copyWith(fontSize: 12),
      ),
    );
  }

  static ColorScheme _getColorScheme(ThemeType themeType) {
    return switch (themeType) {
      ThemeType.normal => ColorScheme.light(
            primary: AppColors.normalPrimary,
            secondary: AppColors.normalSecondary,
            tertiary: AppColors.normalAccent,
            surface: AppColors.normalBackground,
            onPrimary: AppColors.textLight,
            onSecondary: AppColors.textDark,
          ),
      ThemeType.germany => ColorScheme.light(
            primary: AppColors.germanyPrimary,
            secondary: AppColors.germanySecondary,
            tertiary: AppColors.germanyAccent,
            surface: AppColors.germanyBackground,
            onPrimary: AppColors.textLight,
            onSecondary: AppColors.textLight,
          ),
      ThemeType.mexico => ColorScheme.light(
            primary: AppColors.mexicoPrimary,
            secondary: AppColors.mexicoSecondary,
            tertiary: AppColors.mexicoAccent,
            surface: AppColors.mexicoBackground,
            onPrimary: AppColors.textLight,
            onSecondary: AppColors.textDark,
          ),
    };
  }
}