import 'package:court_pro/model/data/upcoming_movie_response.dart';
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
}

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("${Apis.upcomingMovies}?language=en-US&page={pageNumber}")
  Future<UpcomingMovieResponse> fetchUpcomingMovies(
      {@Path("pageNumber") required int page});

  @GET("${Apis.genre}?language=en-US")
  Future<GenreResponse> fetchGenres();

  @GET("${Apis.movie}/{id}?language=en-US")
  Future<Movie> fetchMovieInfo({@Path("id") required int id});

  @GET("${Apis.movie}/{movieId}/videos")
  Future<VideoResponse> fetchVideos({@Path("movieId") required int movieId});
}
