import 'package:hive/hive.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/data/vos/home_page_vo/shelf_vo/shelf_vo.dart';
import 'package:library_book/persistent/dao/shelf_dao/shelf_dao.dart';

class ShelfDaoImpl extends ShelfDao {
  ShelfDaoImpl._();

  static final ShelfDaoImpl _singleton = ShelfDaoImpl._();

  factory ShelfDaoImpl() => _singleton;

  @override
  ShelfVO? getShelfName(String shelfName) => _getShelfBox().get(shelfName);

  @override
  List<ShelfVO>? getShelfVOListFromDatabase() => _getShelfBox().values.toList();

  @override
  Stream<List<ShelfVO>?> getShelfVOListFromDatabaseStream() =>
      Stream.value(getShelfVOListFromDatabase());

  @override
  void saveShelf(ShelfVO shelfVO) {
    _getShelfBox().put(shelfVO.shelfName, shelfVO);
  }

  @override
  Stream watchShelfBox() => _getShelfBox().watch();

  Box<ShelfVO> _getShelfBox() => Hive.box<ShelfVO>(kBoxNameForShelfVO);
}
