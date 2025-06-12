import 'package:court_pro/model/data/genre_model.dart';
import 'package:court_pro/model/data/video_model.dart';
import 'package:court_pro/model/repositories/imovie_repository.dart';

import '../data/movies_response.dart';

class MovieRepository extends IMovieRepository {
  MovieRepository(super.apiService);

  @override
  Future<MoviesResponse> getUpcomingMovies({required int page}) async {
    return apiService.fetchUpcomingMovies(page: page);
  }

  @override
  Future<GenreResponse> fetchGenres() {
    return apiService.fetchGenres();
  }

  @override
  Future<Movie> fetchMovieInfo({required int id}) {
    return apiService.fetchMovieInfo(id: id);
  }

  @override
  Future<VideoResponse> fetchMovieTrailers({required int id}) {
    return apiService.fetchVideos(movieId: id);
  }

  @override
  Future<MoviesResponse> searchByKeyword(
      {required String keyword, required int page}) {
    return apiService.searchByText(keyword: keyword, page: page);
  }
}
