import 'package:library_book/data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'package:library_book/data/vos/home_page_vo/shelf_vo/shelf_vo.dart';
import 'package:library_book/persistent/dao/books_dao/books_dao.dart';
import 'package:library_book/persistent/dao/books_dao/books_dao_impl.dart';
import 'package:library_book/persistent/dao/items_dao/items_dao.dart';
import 'package:library_book/persistent/dao/items_dao/items_dao_impl.dart';
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
import '../vos/search_vo/item_vo/item_vo.dart';
import 'library_apply.dart';

class LibraryApplyImpl extends LibraryApply {
  LibraryApplyImpl._();

  static final LibraryApplyImpl _singleton = LibraryApplyImpl._();

  factory LibraryApplyImpl() => _singleton;

  final LibraryDataAgent _dataAgent = LibraryDataAgentImpl();

  final BooksDao _bookDAO = BooksDaoImpl();
  final ListsDao _listDAO = ListsDaoImpl();
  final SearchDao _searchDao = SearchDaoImpl();
  final ShelfDao _shelfDao = ShelfDaoImpl();
  final ItemsDao _itemsDao = ItemsDaoImpl();

  @override
  Future<List<ItemsVO>?> getItemListFromNetwork(String query) =>
      _dataAgent.getItemList(query).then((value) => value);

  @override
  Future<List<ListsVO>?> getListsListFromNetwork(String publishedDate) =>
      _dataAgent.getLists(publishedDate).then((value) {
        var temp = _listDAO.getListsFromDatabase();
        if (temp!.isEmpty) {
          _listDAO.save(value!);
        }
        return value;
      });

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
    return _itemsDao
        .watchItemsBox()
        .startWith(_itemsDao.getItemListFromDatabaseStream())
        .map((event) => _itemsDao.getItemsListFromDatabase());
  }

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
