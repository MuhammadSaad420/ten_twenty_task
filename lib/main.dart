import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'ui/resources/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const CourtProApp());
}

late AppLocalizations loc;

class CourtProApp extends StatelessWidget {
  const CourtProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
