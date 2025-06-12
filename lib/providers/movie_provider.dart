import 'package:court_pro/model/data/upcoming_movie_response.dart';
import 'package:court_pro/model/repositories/imovie_repository.dart';
import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  final IMovieRepository _movieRepository;

  MovieProvider({required IMovieRepository movieRepository})
      : _movieRepository = movieRepository;

  List<Movie> movies = [];

  UpcomingMovieResponse? movieResponse;

  Future<void> fetchUpcomingMovies() async {
    if (movieResponse != null &&
        movieResponse!.totalPages == movieResponse!.page) return;
    movieResponse = await _movieRepository.getUpcomingMovies(
        page: movieResponse != null ? movieResponse!.page + 1 : 1);
    movies = [...movies, ...movieResponse?.results ?? []];
    notifyListeners();
  }
}
