import 'package:flutter/material.dart';

import '../model/data/movies_response.dart';
import '../model/repositories/imovie_repository.dart';

class MovieFilterProvider with ChangeNotifier {
  final IMovieRepository _movieRepository;

  MovieFilterProvider({required IMovieRepository movieRepository})
      : _movieRepository = movieRepository;

  List<Movie> filteredMovies = [];

  Future<void> searchByKeyword(
      {required String keyword, required int page}) async {
    final movieResponse =
        await _movieRepository.searchByKeyword(keyword: keyword, page: page);
    filteredMovies = movieResponse.results;
    notifyListeners();
  }
}
