import 'package:devfest_app/core/constants/routes.dart';
import 'package:devfest_app/pages/layout_page.dart';
import 'package:devfest_app/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static Route? genereteRoute(RouteSettings settings) {
    //todo : add routes to consts + error page
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => LayoutPage(),
        );

      // default:
      //   return ErrorPage();
    }
    return null;
  }
}
