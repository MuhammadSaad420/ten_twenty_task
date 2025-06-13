import 'package:court_pro/core/di/locator.dart';
import 'package:court_pro/providers/movie_filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'model/repositories/imovie_repository.dart';
import 'providers/movie_provider.dart';
import 'ui/resources/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const CourtProApp());
}

late AppLocalizations loc;

class CourtProApp extends StatelessWidget {
  const CourtProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieProvider(
            movieRepository: locator<IMovieRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => MovieFilterProvider(
            movieRepository: locator<IMovieRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.initialRoute,
        onGenerateRoute: AppRoutes.generateRoute,
        onGenerateTitle: (context) {
          loc = AppLocalizations.of(context)!;
          return loc.appTitle;
        },
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
      ),
    );
  }
}
