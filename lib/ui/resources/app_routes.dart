import 'package:court_pro/ui/screens/dashboard/dashboard_screen.dart';
import 'package:court_pro/ui/screens/movie_details/movie_details_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._();

  //Route Names
  static const initialRoute = '/';
  static const movieDetailsRoute = '/movie_details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case movieDetailsRoute:
        return MaterialPageRoute(builder: (_) => const MovieDetailsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
    }
  }
}
