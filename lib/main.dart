import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/data/vos/home_page_vo/shelf_vo/shelf_vo.dart';

import 'constant/strings.dart';
import 'data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import 'data/vos/home_page_vo/results_vo/buy_links_vo/buy_link_vo.dart';
import 'data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'pages/bottom_navigation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(BuyLinksAdapter());
  Hive.registerAdapter(BooksVOAdapter());
  Hive.registerAdapter(ListsVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());

  await Hive.openBox<String>(kBoxNameForSearchHistoryVO);
  await Hive.openBox<BooksVO>(kBoxNameForBook);
  await Hive.openBox<ListsVO>(kBoxNameForLists);
  await Hive.openBox<ShelfVO>(kBoxNameForShelfVO);

  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kLibraryTitleText,
      home: BottomNavigationPage(),
    );
  }
}
