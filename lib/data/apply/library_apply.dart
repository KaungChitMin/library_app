import '../vos/home_page_vo/results_vo/books_vo.dart';
import '../vos/home_page_vo/results_vo/results_vo.dart';

abstract class LibraryApply{
  ///From NetWork
  //Future<List<BooksVO>?> getBooksListFromNetWork(String publishDate);

  Future<ResultsVO?> getResultsFromNetWork(String publishDate);

  ///From Database
  //Stream<List<BooksVO>?> getBooksListFromDatabase();

  Stream<ResultsVO?> getResultsFromDataBase(String publishDate);
}
