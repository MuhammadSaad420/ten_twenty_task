import 'package:court_pro/model/data/movies_response.dart';
import 'package:court_pro/model/data/video_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../../../model/data/genre_model.dart';
import '../../constants/app_constants.dart';

part 'api_service.g.dart';

class Apis {
  static const String upcomingMovies = 'movie/upcoming';
  static const String genre = 'genre/movie/list';
  static const String movie = 'movie';
  static const String search = 'search/movie';
}

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(Apis.upcomingMovies)
  Future<MoviesResponse> fetchUpcomingMovies({
    @Query("page") required int page,
    @Query("language") String language = "en-US",
  });

  @GET("${Apis.genre}?language=en-US")
  Future<GenreResponse> fetchGenres();

  @GET("${Apis.movie}/{id}?language=en-US")
  Future<Movie> fetchMovieInfo({@Path("id") required int id});

  @GET("${Apis.movie}/{movieId}/videos")
  Future<VideoResponse> fetchVideos({@Path("movieId") required int movieId});

  @GET(Apis.search)
  Future<MoviesResponse> searchByText({
    @Query("query") required String keyword,
    @Query("page") required int page,
    @Query("language") String language = "en-US",
  });
}
