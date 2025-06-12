import 'package:court_pro/model/data/upcoming_movie_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../model/data/genre_model.dart';
import '../../constants/app_constants.dart';

part 'api_service.g.dart';

class Apis {
  static const String upcomingMovies = 'movie/upcoming';
  static const String genre = 'genre/movie/list';
}

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("${Apis.upcomingMovies}?language=en-US&page={pageNumber}")
  Future<UpcomingMovieResponse> fetchUpcomingMovies(
      {@Path("pageNumber") required int page});

  @GET("${Apis.genre}?language=en-US")
  Future<GenreResponse> fetchGenres();
}
