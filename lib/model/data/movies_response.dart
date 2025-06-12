import 'package:freezed_annotation/freezed_annotation.dart';

import 'genre_model.dart';

part 'movies_response.freezed.dart';
part 'movies_response.g.dart';

@freezed
class MoviesResponse with _$MoviesResponse {
  const factory MoviesResponse({
    required int page,
    required List<Movie> results,
    required int totalPages,
    required int totalResults,
  }) = _MoviesResponse;

  factory MoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesResponseFromJson(json);
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
    @Default([]) List<int>? genreIds,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
