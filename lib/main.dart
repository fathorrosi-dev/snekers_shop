import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snekers_shop/provider/cart_provider.dart';
import 'package:snekers_shop/screen/styles/theme.dart';
import 'package:snekers_shop/screen/utils/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
