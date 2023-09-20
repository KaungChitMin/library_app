import 'package:library_book/data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/result_vo/result_vo.dart';

import '../../data/vos/search_vo/item_vo/item_vo.dart';

abstract class LibraryDataAgent {
  /// library api
  Future<ResultsVO?> getResult(String publishedDate);

  Future<List<ListsVO>?> getLists(String publishedDate);

  /// search api
  Future<List<ItemsVO>?> getItemList(String query);
}
