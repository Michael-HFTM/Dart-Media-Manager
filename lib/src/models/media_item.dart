abstract class MediaItem {

  final int _id;
  String _title;
  int _year;

  MediaItem({
    required this._id,
    required this._title,
    required this._year,
  }) {
    _validateTitle(_title);
    _validateYear(_year);
  }

  // getter
  int get id => _id;
  String get title => _title;
  int get year => _year;

  // setter
  set title(String value) {
    _validateTitle(value);
    _title = value;
  }

  set year(int value) {
    _validateYear(value);
    _year = value;
  }

  @override
  String toString() => '[$id] $title ($year)';

  void _validateTitle(String value) {
    if (value.trim().isEmpty) {
      throw ArgumentError.value(value, 'title', 'must not be empty');
    }
  }

  void _validateYear(int value) {
    if (value <= 0) {
      throw ArgumentError.value(value, 'year', 'must be positive');
    }
  }
}
