import 'package:court_pro/model/data/upcoming_movie_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../env.dart';

part 'api_service.g.dart';

class Apis {
  static const String upcomingMovies = 'movie/upcoming';
}

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("${Apis.upcomingMovies}?language=en-US&page={pageNumber}")
  Future<UpcomingMovieResponse> fetchUpcomingMovies(
      {@Path("pageNumber") required int page});
}
