import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/books_vo.dart';
import 'package:library_book/persistent/dao/books_dao/books_dao.dart';

class BooksDaoImpl extends BooksDao {
  @override
  List<BooksVO> getBookListDatabase() => _getBooksBox().values.toList();

  @override
  Stream<List<BooksVO>?> getBookListDatabaseStream() =>
      Stream.value(getBookListDatabase());

  @override
  void clearBooksBoxById(int id) {
    _getBooksBox().delete(id);
  }

  @override
  void save(List<BooksVO> booksList) {
    for(BooksVO booksVO in booksList){
      _getBooksBox().put(booksVO.primaryIsbn10, booksVO);
    }
  }

  @override
  Stream watchBooksBox() => _getBooksBox().watch();

  Box<BooksVO> _getBooksBox() => Hive.box<BooksVO>(kBoxNameForBook);
}
