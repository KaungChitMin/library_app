import '../../../data/vos/search_vo/item_vo/item_vo.dart';

abstract class ItemsDao {
  void save(List<ItemsVO> itemsList);

  List<ItemsVO>? getItemsListFromDatabase();

  Stream<List<ItemsVO>?> getItemListFromDatabaseStream();

  Stream watchItemsBox();
}
