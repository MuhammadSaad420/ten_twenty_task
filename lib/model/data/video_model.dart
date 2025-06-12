import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/enums/video_type.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
class VideoResponse with _$VideoResponse {
  const factory VideoResponse({
    required int id,
    required List<VideoResult> results,
  }) = _VideoResponse;

  factory VideoResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoResponseFromJson(json);
}

@freezed
class VideoResult with _$VideoResult {
  const factory VideoResult({
    required String key,
    required String site,
    required int size,
    required String type,
  }) = _VideoResult;

  factory VideoResult.fromJson(Map<String, dynamic> json) =>
      _$VideoResultFromJson(json);
}
