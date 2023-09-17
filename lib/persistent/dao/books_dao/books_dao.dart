// import '../../../data/vos/home_page_vo/results_vo/books_vo.dart';
//
// abstract class BooksDao {
//   void save(BooksVO booksVO);
//
//   List<BooksVO>? getBookListDatabase();
//
//   Stream<List<BooksVO>?> getBookListDatabaseStream();
//
//   Stream watchBooksBox();
//
//   void clearBooksBox();
// }


import '../../../data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';

abstract class BooksDao{

  void saveBook(BooksVO book);

  List<BooksVO>? getBookFromDatabase();

  Stream watchBookBox();

  Stream<List<BooksVO>?> getBookFromDatabaseStream();

  void clearBookBox();

}