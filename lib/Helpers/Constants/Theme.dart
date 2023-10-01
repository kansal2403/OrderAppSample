import 'package:flutter/material.dart';
import 'AppColors.dart';

ThemeData Light = ThemeData(
  colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.primary,
      // Dark Black color like title on ist screen
      tertiary: AppColors.textPrimary,
      // dark grey like category name on ist screen
      onTertiary: AppColors.textPlaceholder,
      // Toast bg
      tertiaryContainer: AppColors.toast,
      // background color of drawer, horizontal category list item bg
      background: AppColors.lightBackground,
      // background tint on screens (both same)
      onBackground: AppColors.backgroundLight,
      // White color on both dark or light theme
      onSecondary: AppColors.darkLightWhite,
      error: AppColors.error,
      // Green color of printer Settings
      onTertiaryContainer: AppColors.connected,
      shadow: AppColors.lightShadow,
      outline: AppColors.border,
      // boarding screen text color
      errorContainer: AppColors.placeholder),
);

ThemeData Dark = ThemeData.dark().copyWith(
    colorScheme: ThemeData().colorScheme.copyWith(
        primary: AppColors.primary,
        secondary: AppColors.primary,
        tertiary: AppColors.textSecondary,
        onTertiary: AppColors.textPlaceholderDark,
        tertiaryContainer: AppColors.darkBackground,
        background: AppColors.darkBackground,
        onBackground: AppColors.backgroundLight,
        onSecondary: AppColors.darkLightWhite,
        error: AppColors.error,
        onTertiaryContainer: AppColors.connected,
        shadow: AppColors.darkShadow,
        outline: AppColors.border,
        errorContainer: AppColors.placeholder));
