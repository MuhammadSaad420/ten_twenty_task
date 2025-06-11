import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/shared_preference_helper.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(sharedPreferences),
  );
}
