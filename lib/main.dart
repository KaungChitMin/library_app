import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/books_vo.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/buy_links_vo.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/lists_vo.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/results_vo.dart';
import 'package:library_book/pages/home_page.dart';

import 'constant/strings.dart';
import 'pages/bottom_navigation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(BuyLinksVOAdapter());
  Hive.registerAdapter(BooksVOAdapter());
  Hive.registerAdapter(ListsVOAdapter());
  Hive.registerAdapter(ResultsVOAdapter());

  await Hive.openBox<ResultsVO>(kBoxNameForResults);

  runApp(const LibraryApp());
}

class LibraryApp extends StatelessWidget {
  const LibraryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kLibraryTitle,
      home: BottomNavigationPage(),
    );
  }
}
