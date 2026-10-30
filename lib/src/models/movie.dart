import 'media_item.dart';

class Movie extends MediaItem {

  final String _director;
  final int _durationMinutes;

  Movie({
    required super.id,
    required super.title,
    required super.year,
    required this._director,
    required this._durationMinutes,
  });

  // getter
  String get director => _director;
  int get durationMinutes => _durationMinutes;

  @override
  String toString() =>
      'Film ${super.toString()} von $director, $durationMinutes Minuten';
}
