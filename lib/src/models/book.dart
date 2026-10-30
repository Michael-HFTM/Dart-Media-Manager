import 'media_item.dart';

class Book extends MediaItem {

  final String _author;
  final int _pages;

  Book({
    required super.id,
    required super.title,
    required super.year,
    required this._author,
    required this._pages,
  });

  // getter
  String get author => _author;
  int get pages => _pages;

  @override
  String toString() => 'Buch ${super.toString()} von $author, $pages Seiten';
}
