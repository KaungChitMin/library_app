import 'package:library_book/data/vos/home_page_vo/shelf_vo/shelf_vo.dart';

abstract class ShelfDao {
  void saveShelf(ShelfVO shelfVO);

  List<ShelfVO>? getShelfVOListFromDatabase();

  Stream<List<ShelfVO>?> getShelfVOListFromDatabaseStream();

  Stream watchShelfBox();

  ShelfVO? getShelfName(String shelfName);
}


