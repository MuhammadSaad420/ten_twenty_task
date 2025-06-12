class ImageUtils {
  static const String _baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String getPosterUrl(String? posterPath) {
    if (posterPath == null) return '';
    return '$_baseImageUrl$posterPath';
  }
}
