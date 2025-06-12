import 'package:court_pro/model/data/genre_model.dart';
import 'package:court_pro/model/data/upcoming_movie_response.dart';

import '../../core/services/api/api_service.dart';
import '../data/video_model.dart';

abstract class IMovieRepository {
  final ApiService apiService;

  IMovieRepository(this.apiService);

  Future<UpcomingMovieResponse> getUpcomingMovies({required int page});
  Future<GenreResponse> fetchGenres();
  Future<Movie> fetchMovieInfo({required int id});
  Future<VideoResponse> fetchMovieTrailers({required int id});
}
