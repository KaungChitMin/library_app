import '../../data/vos/home_page_vo/results_vo/books_vo.dart';
import '../../data/vos/home_page_vo/results_vo/results_vo.dart';

abstract class LibraryDataAgent {

  Future<ResultsVO?> getResultsFromNetWork(String publishDate);


}
