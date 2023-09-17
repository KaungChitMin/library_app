import '../../data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import '../../data/vos/home_page_vo/results_vo/result_vo/result_vo.dart';
import '../../data/vos/search_vo/items_vo/items_vo.dart';

abstract class LibraryDataAgent {
  Future<ResultsVO?> getResultsVO(String publishDate);

  Future<List<ListsVO>?> getListsList(String publishDate);

  Future<List<ItemsVO>?> getItemList(String query);
}
