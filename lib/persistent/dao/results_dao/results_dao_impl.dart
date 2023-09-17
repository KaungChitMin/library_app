import 'package:hive_flutter/adapters.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/persistent/dao/results_dao/results_dao.dart';

import '../../../data/vos/home_page_vo/results_vo/result_vo/result_vo.dart';

class ResultsDaoImpl extends ResultsDao {
  @override
  ResultsVO? getResultsVOFromDatabase(String publishDate) =>
      _getResultsBox().get(publishDate);

  @override
  Stream<ResultsVO?> getResultsVOFromDatabaseStream(String publishDate) =>
      Stream.value(getResultsVOFromDatabase(publishDate));

  @override
  void save(ResultsVO resultsVO) {
    _getResultsBox().put(resultsVO.publishedDate, resultsVO);
  }

  @override
  Stream watchResultsBox() => _getResultsBox().watch();

  Box<ResultsVO> _getResultsBox() => Hive.box<ResultsVO>(kBoxNameForResults);
}
