import 'package:get/get.dart';

import '../Models/BookModel.dart';

/// In-memory list of books that have been published through the
/// AddNewBook flow. Cloudinary stores the assets (cover, PDF, audio);
/// this repository holds the metadata (title, author, URLs, ...) that
/// HomePage reads.
///
/// To swap this for a real database later, replace the [addBook] and
/// [books] members with calls to Firestore / Supabase / your API. Every
/// UI consumer (`HomePage`, `BookDetails`, ...) only relies on
/// `BookRepository.toRxList()`, so the migration is a single-file change.
class BookRepository {
  BookRepository._();
  static final BookRepository instance = BookRepository._();

  final RxList<BookModel> books = <BookModel>[].obs;

  /// Append a freshly-published book. Triggered by `AddNewBook` after a
  /// successful Cloudinary upload. Returns the new entry so callers can
  /// navigate to its detail page if they want.
  BookModel addBook(BookModel book) {
    books.add(book);
    return book;
  }

  RxList<BookModel> toRxList() => books;
}
