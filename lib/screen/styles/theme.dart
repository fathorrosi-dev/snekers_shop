import 'package:snekers_shop/screen/styles/card_themes.dart';
import 'package:snekers_shop/screen/styles/input_themes.dart';
import 'package:flutter/material.dart';
import 'package:snekers_shop/screen/styles/elevated_button_themes.dart';
import 'package:snekers_shop/screen/styles/text_themes.dart';
import 'package:snekers_shop/screen/utils/constants/colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.dark,
      secondary: AppColors.secondaryDark,
    ),
    scaffoldBackgroundColor: AppColors.light,
    textTheme: TextThemes.lightTextTheme.apply(
      displayColor: AppColors.lightTextPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemes.lightElevatedButtonThemeData,
    inputDecorationTheme: InputThemes.lightInputDecorationThemeData,
    cardTheme: CardThemes.lightThemeData,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.light,
      secondary: AppColors.secondaryLight,
    ),
    scaffoldBackgroundColor: AppColors.dark,
    textTheme: TextThemes.darkTextTheme.apply(
      displayColor: AppColors.darkTextPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemes.darkElevatedButtonThemeData,
    inputDecorationTheme: InputThemes.darkInputDecorationThemeData,
    cardTheme: CardThemes.darkThemeData,
  );
}
