import 'media_item.dart';

class Book extends MediaItem {

  final String _author;
  final int _pages;
  final String _genre;

  Book({
    required super.id,
    required super.title,
    required super.year,
    required this._author,
    required this._pages,
    required this._genre,
  });

  // getter
  String get author => _author;
  int get pages => _pages;
  String get genre => _genre;

  @override
  String toString() =>
      'Buch ${super.toString()} von $author, $pages Seiten, Genre: $genre';
}
