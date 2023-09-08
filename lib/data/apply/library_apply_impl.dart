import 'package:library_book/data/vos/home_page_vo/results_vo/results_vo.dart';
import 'package:library_book/network/data_agent/library_data_agent.dart';
import 'package:library_book/network/data_agent/library_data_agent_impl.dart';
import 'package:library_book/persistent/dao/books_dao/books_dao.dart';
import 'package:library_book/persistent/dao/books_dao/books_dao_impl.dart';
import 'package:library_book/persistent/dao/items_dao/items_dao.dart';
import 'package:library_book/persistent/dao/items_dao/items_dao_impl.dart';
import 'package:library_book/persistent/dao/results_dao/results_dao.dart';
import 'package:library_book/persistent/dao/results_dao/results_dao_impl.dart';
import 'package:library_book/persistent/dao/search_dao/search_dao.dart';
import 'package:library_book/persistent/dao/search_dao/search_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../vos/search_vo/items_vo/items_vo.dart';
import 'library_apply.dart';

class LibraryApplyImpl extends LibraryApply {
  LibraryApplyImpl._();

  static final LibraryApplyImpl _singleton = LibraryApplyImpl._();

  factory LibraryApplyImpl() => _singleton;

  final LibraryDataAgent _dataAgent = LibraryDataAgentImpl();
  final BooksDao _booksDao = BooksDaoImpl();
  final ResultsDao _resultsDao = ResultsDaoImpl();
  final SearchDao _searchDao = SearchDaoImpl();
  final ItemsDao _itemsDao = ItemsDaoImpl();

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
      _dataAgent.getResultsVO(publishDate).then((value) {
        if (value != null) {
          _resultsDao.save(value);
        }
        return value;
      });

  @override
  Future<List<ItemsVO>?> getItemListFromNetWork(String query) =>
      _dataAgent.getItemList(query).then((value) {
        if (value != null) {
          _itemsDao.save(value);
        }
        return value;
      });

  @override
  List<String>? getSearchHistoryList() => _searchDao.getSearchStringList();

  @override
  void saveSearchQuery(String query) {
    _searchDao.save(query);
  }

  @override
  Stream<List<ItemsVO>?> getItemListFromDatabase() {
    return _itemsDao
        .watchItemsBox()
        .startWith(_itemsDao.getItemListFromDatabaseStream())
        .map((event) => _itemsDao.getItemsListFromDatabase());
  }
}
