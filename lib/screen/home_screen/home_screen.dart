import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snekers_shop/screen/home_screen/components/my_bottom_nav_bar.dart';
import 'package:snekers_shop/screen/home_screen/components/pages/cart_page.dart';
import 'package:snekers_shop/screen/home_screen/components/pages/shop_page.dart';
import 'package:snekers_shop/screen/utils/constants/colors.dart';
import 'package:snekers_shop/screen/utils/helpers/helper_function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // this selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  // this method will update ur selected index
  // when the user taps on bottom bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // page to display
  final List<Widget> _pages = [
    // Shope Page
    const ShopPage(),

    // Cart Page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.menu,
              color: HelperFunction.isDarkMode(context)
                  ? AppColors.light
                  : AppColors.dark,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: HelperFunction.isDarkMode(context)
            ? Colors.black
            : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(70),
                  child: SvgPicture.asset(
                    'assets/images/logosvg.svg',
                    colorFilter: ColorFilter.mode(
                      HelperFunction.isDarkMode(context)
                          ? AppColors.light
                          : AppColors.dark,
                      BlendMode.srcIn,
                    ),
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: HelperFunction.isDarkMode(context)
                          ? AppColors.light
                          : AppColors.dark,
                    ),
                    title: Text(
                      'Home',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: HelperFunction.isDarkMode(context)
                          ? AppColors.light
                          : AppColors.dark,
                    ),
                    title: Text(
                      'About',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: HelperFunction.isDarkMode(context)
                      ? AppColors.light
                      : AppColors.dark,
                ),
                title: Text(
                  'Logout',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => _onItemTapped(index),
      ),
    );
  }
}
