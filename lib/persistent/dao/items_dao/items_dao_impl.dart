import 'package:hive/hive.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/persistent/dao/items_dao/items_dao.dart';

import '../../../data/vos/search_vo/items_vo/items_vo.dart';

class ItemsDaoImpl extends ItemsDao {
  ItemsDaoImpl._();

  static final ItemsDaoImpl _singleton = ItemsDaoImpl._();

  factory ItemsDaoImpl() => _singleton;

  @override
  Stream<List<ItemsVO>?> getItemListFromDatabaseStream() =>
      Stream.value(getItemsListFromDatabase());

  @override
  List<ItemsVO>? getItemsListFromDatabase() => _getItemBox().values.toList();

  @override
  void save(List<ItemsVO> itemsList) {
    for (ItemsVO itemVO in itemsList) {
      _getItemBox().put(itemVO.id, itemVO);
    }
  }

  @override
  Stream watchItemsBox() => _getItemBox().watch();

  Box<ItemsVO> _getItemBox() => Hive.box<ItemsVO>(kBoxNameForItems);
}
