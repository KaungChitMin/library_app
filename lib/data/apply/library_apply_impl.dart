// import 'package:library_book/network/data_agent/library_data_agent.dart';
// import 'package:library_book/network/data_agent/library_data_agent_impl.dart';
// import 'package:library_book/persistent/dao/books_dao/books_dao.dart';
// import 'package:library_book/persistent/dao/books_dao/books_dao_impl.dart';
// import 'package:library_book/persistent/dao/items_dao/items_dao.dart';
// import 'package:library_book/persistent/dao/items_dao/items_dao_impl.dart';
// import 'package:library_book/persistent/dao/lists_dao/lists_dao.dart';
// import 'package:library_book/persistent/dao/lists_dao/lists_dao_impl.dart';
// import 'package:library_book/persistent/dao/results_dao/results_dao.dart';
// import 'package:library_book/persistent/dao/results_dao/results_dao_impl.dart';
// import 'package:library_book/persistent/dao/search_dao/search_dao.dart';
// import 'package:library_book/persistent/dao/search_dao/search_dao_impl.dart';
// import 'package:stream_transform/stream_transform.dart';
//
// import '../vos/home_page_vo/results_vo/books_vo/book_vo.dart';
// import '../vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
// import '../vos/home_page_vo/results_vo/result_vo/result_vo.dart';
// import '../vos/search_vo/items_vo/items_vo.dart';
// import 'library_apply.dart';
//
// class LibraryApplyImpl extends LibraryApply {
//   LibraryApplyImpl._();
//
//   static final LibraryApplyImpl _singleton = LibraryApplyImpl._();
//
//   factory LibraryApplyImpl() => _singleton;
//
//   final LibraryDataAgent _dataAgent = LibraryDataAgentImpl();
//   final BooksDao _booksDao = BooksDaoImpl();
//   final ResultsDao _resultsDao = ResultsDaoImpl();
//   final SearchDao _searchDao = SearchDaoImpl();
//   final ItemsDao _itemsDao = ItemsDaoImpl();
//   final ListsDao _listsDao = ListsDaoImpl();
//
//   // @override
//   // Future<List<BooksVO>?> getBooksListFromNetWork(String publishDate) =>
//   //     _dataAgent.getBooksListFromNetWork(publishDate).then((value) {
//   //       if (value != null) {
//   //         _booksDao.save(value);
//   //       }
//   //       return value;
//   //     });
//
//   @override
//   Stream<ResultsVO?> getResultsFromDataBase(String publishDate) {
//     return _resultsDao
//         .watchResultsBox()
//         .startWith(_resultsDao.getResultsVOFromDatabaseStream(publishDate))
//         .map((event) => _resultsDao.getResultsVOFromDatabase(publishDate));
//   }
//
//   @override
//   Future<ResultsVO?> getResultsFromNetWork(String publishDate) =>
//       _dataAgent.getResultsVO(publishDate).then((value) {
//         if (value != null) {
//           _resultsDao.save(value);
//         }
//         return value;
//       });
//
//   @override
//   Future<List<ItemsVO>?> getItemListFromNetWork(String query) =>
//       _dataAgent.getItemList(query).then((value) {
//         if (value != null) {
//           _itemsDao.save(value);
//         }
//         return value;
//       });
//
//   @override
//   List<String>? getSearchHistoryList() => _searchDao.getSearchStringList();
//
//   @override
//   void saveSearchQuery(String query) {
//     _searchDao.save(query);
//   }
//
//   @override
//   Stream<List<ItemsVO>?> getItemListFromDatabase() {
//     return _itemsDao
//         .watchItemsBox()
//         .startWith(_itemsDao.getItemListFromDatabaseStream())
//         .map((event) => _itemsDao.getItemsListFromDatabase());
//   }
//
//   @override
//   Stream<List<ListsVO>?> getListsListFromDatabase() {
//     return _listsDao
//         .watchListsBox()
//         .startWith(_listsDao.getListsFromDatabaseStream())
//         .map((event) => _listsDao.getListsFromDatabase());
//   }
//
//   @override
//   Future<List<ListsVO>?> getListsListFromNetwork(String publishDate) =>
//       _dataAgent.getListsList(publishDate).then((value) {
//         var temp = _listsDao.getListsFromDatabase();
//         if (temp != null && temp.isNotEmpty) {
//           _listsDao.save(value!);
//         }
//         return value;
//       });
//
//   @override
//   void saveBook(BooksVO book) => _booksDao.saveBook(book);
//
//   @override
//   void clearBookBox() => _booksDao.clearBookBox();
//
//   @override
//   Stream<List<BooksVO>?> getBookFromDatabaseStream() {
//     return _booksDao
//         .watchBookBox()
//         .startWith(_booksDao.getBookFromDatabaseStream())
//         .map((event) => _booksDao.getBookFromDatabase());
//   }
// }

import 'package:library_book/data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'package:library_book/data/vos/home_page_vo/shelf_vo/shelf_vo.dart';
import 'package:library_book/persistent/dao/books_dao/books_dao.dart';
import 'package:library_book/persistent/dao/books_dao/books_dao_impl.dart';
import 'package:library_book/persistent/dao/lists_dao/lists_dao.dart';
import 'package:library_book/persistent/dao/lists_dao/lists_dao_impl.dart';
import 'package:library_book/persistent/dao/search_dao/search_dao.dart';
import 'package:library_book/persistent/dao/search_dao/search_dao_impl.dart';
import 'package:library_book/persistent/dao/shelf_dao/shelf_dao.dart';
import 'package:library_book/persistent/dao/shelf_dao/shelf_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../network/data_agent/library_data_agent.dart';
import '../../network/data_agent/library_data_agent_impl.dart';

import '../vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import '../vos/search_vo/items_vo/items_vo.dart';
import 'library_apply.dart';

class LibraryApplyImpl extends LibraryApply {
  LibraryApplyImpl._();

  static final LibraryApplyImpl _singleton = LibraryApplyImpl._();

  factory LibraryApplyImpl() => _singleton;

  final LibraryDataAgent _libraryDataAgent = LibraryDataAgentImpl();

  final BooksDao _bookDAO = BooksDaoImpl();
  final ListsDao _listDAO = ListsDaoImpl();
  final SearchDao _searchDao = SearchDaoImpl();
  final ShelfDao _shelfDao = ShelfDaoImpl();

  @override
  Future<List<ItemsVO>?> getItemListFromNetwork(String search) =>
      _libraryDataAgent.getItemList(search).then((value) => value);

  @override
  Future<List<ListsVO>?> getListsListFromNetwork(String publishedDate) =>
      _libraryDataAgent.getLists(publishedDate).then((value) {
        var temp = _listDAO.getListsFromDatabase();
        if (temp!.isEmpty) {
          _listDAO.save(value!);
        }
        return value;
      });

  //database
  @override
  Stream<List<ListsVO>?> getListsFromDataBase() {
    return _listDAO
        .watchListsBox()
        .startWith(_listDAO.getListsFromDatabaseStream())
        .map((event) => _listDAO.getListsFromDatabase());
  }

  @override
  List<String>? getSearchHistoryList() => _searchDao.getSearchStringList();

  @override
  void saveSearchHistory(String query) => _searchDao.save(query);

  @override
  void saveBook(BooksVO book) => _bookDAO.saveBook(book);

  @override
  void clearBookBox() => _bookDAO.clearBookBox();

  @override
  Stream<List<BooksVO>?> getBookFromDatabase() {
    return _bookDAO
        .watchBookBox()
        .startWith(_bookDAO.getBookFromDatabaseStream())
        .map((event) => _bookDAO.getBookFromDatabase());
  }

  @override
  Stream<List<ItemsVO>?> getItemListFromDatabase() {
    // TODO: implement getItemListFromDatabase
    throw UnimplementedError();
  }

  // @override
  // void createShelf(String shelfName, List<BooksVO> bookList) {
  //   ShelfVO shelfVO = ShelfVO(DateTime.now().toString(), shelfName, bookList);
  //   return _shelfDao.saveShelf(shelfVO);
  // }
  //
  // @override
  // Stream<List<ShelfVO>?> getShelfVOFromDatabase() {
  //   return _shelfDao
  //       .watchShelfBox()
  //       .startWith(_shelfDao.getShelfVOListFromDatabaseStream())
  //       .map((event) => _shelfDao.getShelfVOListFromDatabase());
  // }
  @override
  void createShelf(String shelfName, List<BooksVO> bookList) {
    ShelfVO shelfVO = ShelfVO(DateTime.now().toString(), shelfName, bookList);
    return _shelfDao.saveShelf(shelfVO);
  }

  @override
  Stream<List<ShelfVO>?> getShelfVOFromDatabase() {
    return _shelfDao
        .watchShelfBox()
        .startWith(_shelfDao.getShelfVOListFromDatabaseStream())
        .map((event) => _shelfDao.getShelfVOListFromDatabase());
  }
}
