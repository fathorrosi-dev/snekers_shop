import 'package:go_router/go_router.dart';
import 'package:snekers_shop/screen/home_screen/home_screen.dart';
import 'package:snekers_shop/screen/intro_screen/intro_screen.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: 'introScreen',
        path: '/',
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
        name: 'homeScreen',
        path: '/homeScreen',
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}

final router = buildRouter();
