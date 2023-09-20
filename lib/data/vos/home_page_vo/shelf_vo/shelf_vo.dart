import 'package:hive/hive.dart';
import 'package:library_book/constant/hive_constant.dart';

import '../results_vo/books_vo/book_vo.dart';

part 'shelf_vo.g.dart';

@HiveType(typeId: kHiveTypeIDForShelf)
class ShelfVO {
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? shelfName;

  @HiveField(2)
  List<BooksVO> bookList;

  ShelfVO(this.id, this.shelfName, this.bookList);
}
