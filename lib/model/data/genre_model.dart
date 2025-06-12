import 'package:court_pro/core/enums/genre_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_model.freezed.dart';
part 'genre_model.g.dart';

@freezed
class GenreResponse with _$GenreResponse {
  const factory GenreResponse({
    required List<Genre> genres,
  }) = _GenreResponse;

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
      _$GenreResponseFromJson(json);
}

@freezed
class Genre with _$Genre {
  const factory Genre({
    required int id,
    @JsonKey(unknownEnumValue: GenreType.action) required GenreType name,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
