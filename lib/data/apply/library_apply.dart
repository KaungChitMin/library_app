import 'package:library_book/data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'package:library_book/data/vos/home_page_vo/shelf_vo/shelf_vo.dart';

import '../vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import '../vos/search_vo/item_vo/item_vo.dart';

abstract class LibraryApply {
  ///For Network
  Future<List<ListsVO>?> getListsListFromNetwork(String publishedDate);

  Future<List<ItemsVO>?> getItemListFromNetwork(String query);

  ///For database
  Stream<List<ListsVO>?> getListsFromDataBase();

  Stream<List<BooksVO>?> getBookFromDatabase();

  Stream<List<ShelfVO>?> getShelfVOFromDatabase();

  //Stream<List<ItemsVO>?> getItemListFromDatabase();

  List<String>? getSearchHistoryList();

  void saveSearchHistory(String query);

  void createShelf(String shelfName, List<BooksVO> bookList);

  void saveBook(BooksVO book);

  void clearBookBox();
}
