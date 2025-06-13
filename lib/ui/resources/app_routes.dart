import 'package:court_pro/model/args/seating_screen_args.dart';
import 'package:court_pro/ui/screens/dashboard/dashboard_screen.dart';
import 'package:court_pro/ui/screens/hall_selection/hall_selection_screen.dart';
import 'package:court_pro/ui/screens/movie_details/movie_details_screen.dart';
import 'package:court_pro/ui/screens/seating/seating_screen.dart';
import 'package:court_pro/ui/screens/trailer/trailer_screen.dart';
import 'package:flutter/material.dart';

import '../../model/data/movies_response.dart';

class AppRoutes {
  AppRoutes._();

  //Route Names
  static const initialRoute = '/';
  static const movieDetailsRoute = '/movie_details';
  static const trailerRoute = '/trailer';
  static const seatingRoute = '/seating';
  static const hallSelectionRoute = '/hall_selection';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
      case movieDetailsRoute:
        return MaterialPageRoute(
          builder: (_) {
            final matchId = settings.arguments as int;
            return MovieDetailsScreen(
              matchId: matchId,
            );
          },
        );
      case trailerRoute:
        return MaterialPageRoute(
          builder: (_) {
            final videoId = settings.arguments as String;
            return TrailerScreen(
              videoId: videoId,
            );
          },
        );
      case seatingRoute:
        return MaterialPageRoute(
          builder: (_) {
            final seatingArgs = settings.arguments as SeatingScreenArgs;
            return SeatingScreen(
              seatingArgs: seatingArgs,
            );
          },
        );
      case hallSelectionRoute:
        return MaterialPageRoute(
          builder: (_) {
            final movie = settings.arguments as Movie;
            return HallSelectionScreen(
              movie: movie,
            );
          },
        );
      default:
        return MaterialPageRoute(builder: (_) => const SizedBox.shrink());
    }
  }
}
