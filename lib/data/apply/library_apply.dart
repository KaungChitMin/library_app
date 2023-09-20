// import '../vos/home_page_vo/results_vo/books_vo/book_vo.dart';
// import '../vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
// import '../vos/home_page_vo/results_vo/result_vo/result_vo.dart';
// import '../vos/search_vo/items_vo/items_vo.dart';
//
// abstract class LibraryApply {
//   ///From NetWork
//
//   Future<ResultsVO?> getResultsFromNetWork(String publishDate);
//
//   Future<List<ListsVO>?> getListsListFromNetwork(String publishDate);
//
//   Future<List<ItemsVO>?> getItemListFromNetWork(String query);
//
//   ///From Database
//
//   Stream<ResultsVO?> getResultsFromDataBase(String publishDate);
//
//   Stream<List<BooksVO>?> getBookFromDatabaseStream();
//
//   Stream<List<ListsVO>?> getListsListFromDatabase();
//
//   Stream<List<ItemsVO>?> getItemListFromDatabase();
//
//   List<String>? getSearchHistoryList();
//
//   void saveSearchQuery(String query);
//
//   void saveBook(BooksVO book);
//
//   void clearBookBox();
// }

import 'package:library_book/data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'package:library_book/data/vos/home_page_vo/shelf_vo/shelf_vo.dart';

import '../vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import '../vos/home_page_vo/results_vo/result_vo/result_vo.dart';
import '../vos/search_vo/items_vo/items_vo.dart';

abstract class LibraryApply {
  ///For Network
  Future<List<ListsVO>?> getListsListFromNetwork(String publishedDate);

  Future<List<ItemsVO>?> getItemListFromNetwork(String search);

  ///For database
  Stream<List<ListsVO>?> getListsFromDataBase();

  Stream<List<BooksVO>?> getBookFromDatabase();

  Stream<List<ItemsVO>?> getItemListFromDatabase();

  List<String>? getSearchHistoryList();

  void saveSearchHistory(String query);

  Stream<List<ShelfVO>?> getShelfVOFromDatabase();

  void createShelf(String shelfName, List<BooksVO> bookList);

  void saveBook(BooksVO book);

  void clearBookBox();
}
