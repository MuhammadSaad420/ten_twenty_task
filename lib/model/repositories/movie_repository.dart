import 'package:court_pro/model/repositories/imovie_repository.dart';

import '../data/upcoming_movie_response.dart';

class MovieRepository extends IMovieRepository {
  MovieRepository(super.apiService);

  @override
  Future<UpcomingMovieResponse> getUpcomingMovies({required int page}) async {
    return await apiService.fetchUpcomingMovies(page: page);
  }
}
