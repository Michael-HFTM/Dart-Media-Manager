import '../models/book.dart';
import '../models/media_item.dart';
import '../models/movie.dart';

class MediaDatabase {

  static const _ioDelay = Duration(milliseconds: 200);

  final Map<int, MediaItem> _items = {};

  // read access
  Future<List<MediaItem>> get all async {
    await _simulateIo();
    return List.unmodifiable(_items.values);
  }

  Future<List<Book>> get books async {
    await _simulateIo();
    return List.unmodifiable(_items.values.whereType<Book>());
  }

  Future<List<Movie>> get movies async {
    await _simulateIo();
    return List.unmodifiable(_items.values.whereType<Movie>());
  }

  Future<MediaItem?> findById(int id) async {
    await _simulateIo();
    return _items[id];
  }

  Future<List<MediaItem>> findByTitle(String query) async {
    await _simulateIo();
    return _items.values.where((item) => _contains(item.title, query)).toList();
  }

  Future<List<Book>> findBooks({
    String? author,
    String? genre,
    int? year,
  }) async {
    await _simulateIo();
    return _items.values.whereType<Book>().where((book) {
      return (author == null || _contains(book.author, author)) &&
          (genre == null || _contains(book.genre, genre)) &&
          (year == null || book.year == year);
    }).toList();
  }

  // write access
  Future<void> add(MediaItem item) async {
    await _simulateIo();
    if (_items.containsKey(item.id)) {
      throw ArgumentError.value(item.id, 'id', 'already exists');
    }
    _items[item.id] = item;
  }

  Future<bool> update(MediaItem item) async {
    await _simulateIo();
    if (!_items.containsKey(item.id)) {
      return false;
    }
    _items[item.id] = item;
    return true;
  }

  Future<bool> delete(int id) async {
    await _simulateIo();
    return _items.remove(id) != null;
  }

  // helpers

  // The delay always comes before the data access, so that checking and
  // writing run without interruption and concurrent calls cannot interfere
  // with each other.
  Future<void> _simulateIo() => Future.delayed(_ioDelay);

  bool _contains(String text, String query) {
    return text.toLowerCase().contains(query.toLowerCase());
  }
}
