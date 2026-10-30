import 'package:media_manager/media_manager.dart';

void main(List<String> arguments) {
  final db = MediaDatabase();

  printTitle('Buecher hinzufuegen');
  final books = [
    Book(id: 1, title: 'Dune', year: 1965, author: 'Frank Herbert', pages: 612, genre: 'Science-Fiction'),
    Book(id: 2, title: 'Neuromancer', year: 1984, author: 'William Gibson', pages: 271, genre: 'Science-Fiction'),
    Book(id: 3, title: 'Der Hobbit', year: 1937, author: 'J. R. R. Tolkien', pages: 310, genre: 'Fantasy'),
    Book(id: 4, title: 'Der Herr der Ringe', year: 1954, author: 'J. R. R. Tolkien', pages: 1178, genre: 'Fantasy'),
  ];
  for (final book in books) {
    db.add(book);
    print('Hinzugefuegt: ${book.title}');
  }
  db.add(Movie(id: 5, title: 'Alien', year: 1979, director: 'Ridley Scott', durationMinutes: 117));
  print('Hinzugefuegt: Alien (Film, erscheint nicht in der Buchliste)');

  printTitle('Doppelte ID wird abgelehnt');
  try {
    db.add(Book(id: 1, title: 'Kopie', year: 2000, author: 'Unbekannt', pages: 1, genre: 'Keines'));
  } on ArgumentError catch (e) {
    print('Fehler: $e');
  }

  printTitle('Alle Buecher');
  printBooks(db.books);

  printTitle('Suche nach Autor "tolkien"');
  printBooks(db.findBooks(author: 'tolkien'));

  printTitle('Suche nach Genre "Science-Fiction"');
  printBooks(db.findBooks(genre: 'Science-Fiction'));

  printTitle('Suche nach Jahr 1984');
  printBooks(db.findBooks(year: 1984));

  printTitle('Suche nach Genre "Fantasy" und Jahr 1937');
  printBooks(db.findBooks(genre: 'Fantasy', year: 1937));

  printTitle('Suche ohne Treffer (Autor "Rowling")');
  printBooks(db.findBooks(author: 'Rowling'));

  printTitle('Buch mit ID 2 loeschen');
  print(db.delete(2) ? 'Geloescht.' : 'Nicht gefunden.');

  printTitle('Buch mit ID 2 erneut loeschen');
  print(db.delete(2) ? 'Geloescht.' : 'Nicht gefunden.');

  printTitle('Alle Buecher nach dem Loeschen');
  printBooks(db.books);
}

void printTitle(String title) {
  print('\n=== $title ===');
}

void printBooks(List<Book> books) {
  if (books.isEmpty) {
    print('Keine Buecher gefunden.');
    return;
  }
  books.forEach(print);
}
