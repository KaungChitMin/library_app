import '../../../data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';

abstract class ListsDao {
  void save(List<ListsVO> saveListVOList);

  List<ListsVO>? getListsFromDatabase();

  Stream<List<ListsVO>?> getListsFromDatabaseStream();

  Stream watchListsBox();
}
