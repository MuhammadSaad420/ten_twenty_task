import 'package:freezed_annotation/freezed_annotation.dart';

import 'genre_model.dart';

part 'upcoming_movie_response.freezed.dart';
part 'upcoming_movie_response.g.dart';

@freezed
class UpcomingMovieResponse with _$UpcomingMovieResponse {
  const factory UpcomingMovieResponse({
    required Dates dates,
    required int page,
    required List<Movie> results,
    required int totalPages,
    required int totalResults,
  }) = _UpcomingMovieResponse;

  factory UpcomingMovieResponse.fromJson(Map<String, dynamic> json) =>
      _$UpcomingMovieResponseFromJson(json);
}

@freezed
class Dates with _$Dates {
  const factory Dates({
    required String maximum,
    required String minimum,
  }) = _Dates;

  factory Dates.fromJson(Map<String, dynamic> json) => _$DatesFromJson(json);
}

@freezed
class Movie with _$Movie {
  const factory Movie({
    required bool adult,
    String? backdropPath,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    String? posterPath,
    required String releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
    @Default([]) List<Genre>? genres,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
