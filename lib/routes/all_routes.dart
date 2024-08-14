import 'package:flutter/material.dart';
import 'package:namozvaqtlari/screens/home/home_page.dart';
import 'package:namozvaqtlari/screens/main/main_page.dart';
import 'package:namozvaqtlari/screens/slpash/splash_page.dart';

class AllRoutesNames {
  static const String home = "/home";
  static const String splash = "/splash";
  static const String mainPage = "/mainPage";
}

class AllRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AllRoutesNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case AllRoutesNames.home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case AllRoutesNames.mainPage:
        return MaterialPageRoute(
            builder: (context) => MainPage(regionName: (settings.arguments as String)));
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
