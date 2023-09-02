import '../../../data/vos/home_page_vo/results_vo/books_vo.dart';

abstract class BooksDao {
  void save(List <BooksVO> booksList);

  List<BooksVO>? getBookListDatabase();

  Stream<List<BooksVO>?> getBookListDatabaseStream();

  Stream watchBooksBox();

  void clearBooksBoxById(int id);
}
