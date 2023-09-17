import 'package:hive/hive.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/persistent/dao/lists_dao/lists_dao.dart';

import '../../../data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';

class ListsDaoImpl extends ListsDao {
  ListsDaoImpl._();

  static final ListsDaoImpl _singleton = ListsDaoImpl._();

  factory ListsDaoImpl() => _singleton;

  @override
  List<ListsVO>? getListsFromDatabase() => _getListsBox().values.toList();

  @override
  Stream<List<ListsVO>?> getListsFromDatabaseStream() =>
      Stream.value(getListsFromDatabase());

  @override
  void save(List<ListsVO> saveListVOList) {
    for (var listsVO in saveListVOList) {
      _getListsBox().put(listsVO.listName, listsVO);
    }
  }

  @override
  Stream watchListsBox() => _getListsBox().watch();

  Box<ListsVO> _getListsBox() => Hive.box<ListsVO>(kBoxNameForLists);

  Box<ListsVO> get getListsBox => _getListsBox();
}
