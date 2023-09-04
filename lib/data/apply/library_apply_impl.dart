import 'package:library_book/data/vos/home_page_vo/results_vo/books_vo.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/results_vo.dart';
import 'package:library_book/network/data_agent/library_data_agent.dart';
import 'package:library_book/network/data_agent/library_data_agent_impl.dart';
import 'package:library_book/persistent/dao/books_dao/books_dao.dart';
import 'package:library_book/persistent/dao/books_dao/books_dao_impl.dart';
import 'package:library_book/persistent/dao/results_dao/results_dao.dart';
import 'package:library_book/persistent/dao/results_dao/results_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import 'library_apply.dart';

class LibraryApplyImpl extends LibraryApply {
  LibraryApplyImpl._();

  static final LibraryApplyImpl _singleton = LibraryApplyImpl._();

  factory LibraryApplyImpl() => _singleton;

  final LibraryDataAgent _dataAgent = LibraryDataAgentImpl();
  final BooksDao _booksDao = BooksDaoImpl();
  final ResultsDao _resultsDao = ResultsDaoImpl();



  // @override
  // Future<List<BooksVO>?> getBooksListFromNetWork(String publishDate) =>
  //     _dataAgent.getBooksListFromNetWork(publishDate).then((value) {
  //       if (value != null) {
  //         _booksDao.save(value);
  //       }
  //       return value;
  //     });

  @override
  Stream<ResultsVO?> getResultsFromDataBase(String publishDate) {
    return _resultsDao
        .watchResultsBox()
        .startWith(_resultsDao.getResultsVOFromDatabaseStream(publishDate))
        .map((event) => _resultsDao.getResultsVOFromDatabase(publishDate));
  }

  @override
  Future<ResultsVO?> getResultsFromNetWork(String publishDate) =>
      _dataAgent.getResultsFromNetWork(publishDate).then((value) {
        if (value != null) {
          _resultsDao.save(value);
        }
        return value;
      });
}
