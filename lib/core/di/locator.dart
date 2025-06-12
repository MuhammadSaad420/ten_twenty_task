import 'package:court_pro/core/services/api/api_service.dart';
import 'package:court_pro/model/repositories/imovie_repository.dart';
import 'package:court_pro/model/repositories/movie_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../env.dart';
import '../helper/shared_preference_helper.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton<SharedPreferencesHelper>(
    SharedPreferencesHelper(sharedPreferences),
  );

  Dio dio = Dio(
    BaseOptions(
      headers: {
        "accept": "application/json",
        "Authorization": "Bearer ${Env.apiKey}"
      },
    ),
  );
  dio.interceptors.add(PrettyDioLogger());

  locator.registerSingleton<IMovieRepository>(
    MovieRepository(ApiService(dio)),
  );
}
