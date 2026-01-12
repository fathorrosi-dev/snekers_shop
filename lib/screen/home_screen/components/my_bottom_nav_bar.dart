import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:snekers_shop/screen/utils/constants/colors.dart';
import 'package:snekers_shop/screen/utils/helpers/helper_function.dart';

// ignore: must_be_immutable
class MyBottomNavBar extends StatelessWidget {
  final Function(int) onTabChange;
  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        textStyle: Theme.of(context).textTheme.labelMedium,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 800),
        gap: 8,
        color: HelperFunction.isDarkMode(context)
            ? AppColors.darkTextSecondary
            : AppColors.lightTextSecondary,
        activeColor: HelperFunction.isDarkMode(context)
            ? AppColors.darkTextPrimary
            : AppColors.lightTextPrimary,
        tabBackgroundColor: HelperFunction.isDarkMode(context)
            ? AppColors.secondaryDark
            : AppColors.secondaryLight,
        tabBorderRadius: 15,
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: (value) => onTabChange(value),
        tabs: const [
          GButton(icon: Icons.home, text: 'Shop'),
          GButton(icon: Icons.shopping_bag_rounded, text: 'Cart'),
        ],
      ),
    );
  }
}
