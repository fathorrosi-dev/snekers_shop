import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snekers_shop/screen/utils/constants/colors.dart';

class ElevatedButtonThemes {
  ElevatedButtonThemes._();

  static final ElevatedButtonThemeData lightElevatedButtonThemeData =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColors.light,
          backgroundColor: AppColors.dark,
          disabledForegroundColor: AppColors.dark,
          disabledBackgroundColor: AppColors.dark,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.darkTextPrimary,
          ),
        ),
      );

  static final ElevatedButtonThemeData darkElevatedButtonThemeData =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: AppColors.dark,
          backgroundColor: AppColors.light,
          disabledForegroundColor: AppColors.light,
          disabledBackgroundColor: AppColors.light,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.lightTextPrimary,
          ),
        ),
      );
}
