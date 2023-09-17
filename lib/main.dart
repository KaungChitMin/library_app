import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/data/vos/search_vo/items_vo/access_info_vo.dart';
import 'package:library_book/data/vos/search_vo/items_vo/epub_vo.dart';
import 'package:library_book/data/vos/search_vo/items_vo/image_links_vo.dart';
import 'package:library_book/data/vos/search_vo/items_vo/industry_identifiers_vo.dart';
import 'package:library_book/data/vos/search_vo/items_vo/panelization_summary_vo.dart';
import 'package:library_book/data/vos/search_vo/items_vo/reading_modes_vo.dart';
import 'package:library_book/data/vos/search_vo/items_vo/sale_info_vo.dart';
import 'package:library_book/data/vos/search_vo/items_vo/search_info_vo.dart';
import 'package:library_book/data/vos/search_vo/items_vo/series_info_vo.dart';
import 'package:library_book/data/vos/search_vo/items_vo/volume_info_vo.dart';
import 'package:library_book/data/vos/search_vo/items_vo/volume_series_vo.dart';
import 'constant/strings.dart';
import 'data/vos/home_page_vo/results_vo/books_vo/book_vo.dart';
import 'data/vos/home_page_vo/results_vo/buy_links_vo/buy_link_vo.dart';
import 'data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'data/vos/home_page_vo/results_vo/result_vo/result_vo.dart';
import 'data/vos/search_vo/items_vo/items_vo.dart';
import 'pages/bottom_navigation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(BuyLinksAdapter());
  Hive.registerAdapter(BooksVOAdapter());
  Hive.registerAdapter(ListsVOAdapter());
  Hive.registerAdapter(ResultsVOAdapter());
  // Hive.registerAdapter(AccessInfoVOAdapter());
  // Hive.registerAdapter(EpubVOAdapter());
  // Hive.registerAdapter(ImageLinksVOAdapter());
  // Hive.registerAdapter(IndustryIdentifiersVOAdapter());
  // Hive.registerAdapter(ItemsVOAdapter());
  // Hive.registerAdapter(PanelizationSummaryVOAdapter());
  // Hive.registerAdapter(ReadingModesVOAdapter());
  // Hive.registerAdapter(SaleInfoVOAdapter());
  // Hive.registerAdapter(SearchInfoVOAdapter());
  // Hive.registerAdapter(SeriesInfoVOAdapter());
  // Hive.registerAdapter(VolumeInfoVOAdapter());
  // Hive.registerAdapter(VolumeSeriesVOAdapter());

  await Hive.openBox<ResultsVO>(kBoxNameForResults);
  await Hive.openBox<String>(kBoxNameForSearchHistoryVO);
  await Hive.openBox<BooksVO>(kBoxNameForBook);
  await Hive.openBox<ListsVO>(kBoxNameForLists);
  // await Hive.openBox<ItemsVO>(kBoxNameForItems);

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
