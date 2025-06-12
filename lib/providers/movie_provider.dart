import 'package:court_pro/model/data/genre_model.dart';
import 'package:court_pro/model/data/movies_response.dart';
import 'package:court_pro/model/data/video_model.dart';
import 'package:court_pro/model/repositories/imovie_repository.dart';
import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  final IMovieRepository _movieRepository;

  MovieProvider({required IMovieRepository movieRepository})
      : _movieRepository = movieRepository;

  List<Movie> movies = [];
  List<Genre> genres = [];
  List<VideoResult> trailers = [];

  MoviesResponse? movieResponse;

  Future<void> fetchUpcomingMovies() async {
    if (movieResponse != null &&
        movieResponse!.totalPages == movieResponse!.page) return;
    movieResponse = await _movieRepository.getUpcomingMovies(
        page: movieResponse != null ? movieResponse!.page + 1 : 1);
    movies = [...movies, ...movieResponse?.results ?? []];
    notifyListeners();
  }

  Future<void> fetchGenres() async {
    final genreResponse = await _movieRepository.fetchGenres();
    genres = genreResponse.genres;
    notifyListeners();
  }

  Future<Movie> fetchMovieInfo({required int id}) async {
    List<dynamic> results = await Future.wait(
      [
        fetchMovieTrailers(id: id),
        _movieRepository.fetchMovieInfo(id: id),
      ],
    );
    return results.last;
  }

  Future<void> fetchMovieTrailers({required int id}) async {
    final videoResponse = await _movieRepository.fetchMovieTrailers(id: id);
    trailers = videoResponse.results;
  }
}
