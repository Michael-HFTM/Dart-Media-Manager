# Media Manager

Eine einfache Medienverwaltung für Bücher und Filme als Dart-Konsolenapplikation.
Die Daten liegen in einer simulierten Datenbank im Speicher, deren Zugriffe
asynchron ablaufen.

## Voraussetzungen

- Dart SDK 3.13.7 oder neuer

## Starten

```sh
dart pub get
dart run bin/media_manager.dart
```

Die Applikation führt die Operationen der Medienverwaltung der Reihe nach aus
und gibt die Ergebnisse auf der Konsole aus: Hinzufügen, Auflisten, Suchen und
Löschen. Beim Beenden gehen die Daten verloren.

## Struktur

```
bin/media_manager.dart                  Konsolenapplikation
lib/media_manager.dart                  Exporte der Bibliothek
lib/src/models/media_item.dart          Abstrakte Basisklasse
lib/src/models/book.dart                Buch
lib/src/models/movie.dart               Film
lib/src/services/media_database.dart    Simulierte Datenbank
```

## Verwendung

```dart
import 'package:media_manager/media_manager.dart';

Future<void> main() async {
  final db = MediaDatabase();

  await db.add(Book(
    id: 1,
    title: 'Dune',
    year: 1965,
    author: 'Frank Herbert',
    pages: 612,
    genre: 'Science-Fiction',
  ));

  final books = await db.findBooks(author: 'herbert');
  books.forEach(print);

  await db.delete(1);
}
```
