import '../models/book.dart';
import '../models/media_item.dart';
import '../models/movie.dart';

class MediaDatabase {

  final Map<int, MediaItem> _items = {};

  // getter
  List<MediaItem> get all => List.unmodifiable(_items.values);
  List<Book> get books => List.unmodifiable(_items.values.whereType<Book>());
  List<Movie> get movies => List.unmodifiable(_items.values.whereType<Movie>());

  void add(MediaItem item) {
    if (_items.containsKey(item.id)) {
      throw ArgumentError.value(item.id, 'id', 'already exists');
    }
    _items[item.id] = item;
  }

  MediaItem? findById(int id) => _items[id];

  List<MediaItem> findByTitle(String query) {
    return _items.values.where((item) => _contains(item.title, query)).toList();
  }

  List<Book> findBooks({String? author, String? genre, int? year}) {
    return _items.values.whereType<Book>().where((book) {
      return (author == null || _contains(book.author, author)) &&
          (genre == null || _contains(book.genre, genre)) &&
          (year == null || book.year == year);
    }).toList();
  }

  bool update(MediaItem item) {
    if (!_items.containsKey(item.id)) {
      return false;
    }
    _items[item.id] = item;
    return true;
  }

  bool delete(int id) => _items.remove(id) != null;

  bool _contains(String text, String query) {
    return text.toLowerCase().contains(query.toLowerCase());
  }
}
