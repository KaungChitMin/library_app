// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:library_book/constant/hive_constant.dart';
// import 'package:library_book/data/vos/home_page_vo/results_vo/books_vo.dart';
// import 'package:library_book/persistent/dao/books_dao/books_dao.dart';
//
// class BooksDaoImpl extends BooksDao {
//   @override
//   List<BooksVO> getBookListDatabase() => _getBooksBox().values.toList();
//
//   @override
//   Stream<List<BooksVO>?> getBookListDatabaseStream() =>
//       Stream.value(getBookListDatabase());
//
//   @override
//   void clearBooksBox() => _getBooksBox().clear();
//
//   @override
//   void save(BooksVO booksVO) {
//     _getBooksBox().put(booksVO.title, booksVO);
//   }
//
//   @override
//   Stream watchBooksBox() => _getBooksBox().watch();
//
//   Box<BooksVO> _getBooksBox() => Hive.box<BooksVO>(kBoxNameForBook);
// }

import 'package:hive/hive.dart';

import '../../../constant/hive_constant.dart';
import '../../../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import 'books_dao.dart';

class BooksDaoImpl extends BooksDao {
  BooksDaoImpl._();

  static final BooksDaoImpl _singleton = BooksDaoImpl._();

  factory BooksDaoImpl() => _singleton;

  Box<BooksVO> _getBookBox() => Hive.box<BooksVO>(kBoxNameForBook);

  @override
  List<BooksVO>? getBookFromDatabase() {
    List<BooksVO>? books = _getBookBox().values.toList();
    books.sort(
      (a, b) => a.order!.compareTo(b.order!),
    );
    return books;
  }

  @override
  Stream<List<BooksVO>?> getBookFromDatabaseStream() =>
      Stream.value(getBookFromDatabase());

  @override
  void saveBook(BooksVO book) {
    int order = 0;
    order++;
    book.order = order;
    _getBookBox().put(book.title, book);
  }

  @override
  Stream watchBookBox() => _getBookBox().watch();

  @override
  void clearBookBox() {
    var books = _getBookBox().values.toList();
    for (var book in books) {
      _getBookBox().delete(book.title);
    }
  }
}
