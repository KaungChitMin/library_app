import '../../data/vos/home_page_vo/results_vo/books_vo.dart';
import '../../data/vos/home_page_vo/results_vo/results_vo.dart';

abstract class LibraryDataAgent {
  //Future<List<BooksVO>?> getBooksListFromNetWork(String publishDate);

  Future<ResultsVO?> getResultsFromNetWork(String publishDate);
}
