import '../vos/home_page_vo/results_vo/results_vo.dart';
import '../vos/search_vo/items_vo/items_vo.dart';

abstract class LibraryApply {
  ///From NetWork

  Future<ResultsVO?> getResultsFromNetWork(String publishDate);

  Future<List<ItemsVO>?> getItemListFromNetWork(String query);

  ///From Database

  Stream<ResultsVO?> getResultsFromDataBase(String publishDate);

  Stream<List<ItemsVO>?> getItemListFromDatabase();

  void saveSearchQuery(String query);

  List<String>? getSearchHistoryList();
}
