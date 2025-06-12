import 'package:court_pro/model/data/genre_model.dart';
import 'package:court_pro/model/repositories/imovie_repository.dart';

import '../data/upcoming_movie_response.dart';

class MovieRepository extends IMovieRepository {
  MovieRepository(super.apiService);

  @override
  Future<UpcomingMovieResponse> getUpcomingMovies({required int page}) async {
    return apiService.fetchUpcomingMovies(page: page);
  }

  @override
  Future<GenreResponse> fetchGenres() {
    return apiService.fetchGenres();
  }
}
