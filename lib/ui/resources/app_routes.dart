import 'package:court_pro/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  //Route Names
  static const initialRoute = '/';
  static const loginRoute = '/login_screen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
