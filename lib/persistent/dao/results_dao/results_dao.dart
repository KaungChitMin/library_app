
import '../../../data/vos/home_page_vo/results_vo/result_vo/result_vo.dart';

abstract class ResultsDao {
  void save(ResultsVO resultsVO);

  ResultsVO? getResultsVOFromDatabase(String publishDate);

  Stream<ResultsVO?> getResultsVOFromDatabaseStream(String publishDate);

  Stream watchResultsBox();
}
