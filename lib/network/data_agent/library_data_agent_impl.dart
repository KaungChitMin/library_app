import 'package:dio/dio.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/result_vo/result_vo.dart';
import 'package:library_book/network/api/search_api/search_api.dart';

import '../../constant/api_constant.dart';
import '../../data/vos/search_vo/item_vo/item_vo.dart';
import '../api/library_api/library_api.dart';
import 'library_data_agent.dart';

class LibraryDataAgentImpl extends LibraryDataAgent {
  LibraryDataAgentImpl._();

  static final LibraryDataAgentImpl _singleton = LibraryDataAgentImpl._();

  factory LibraryDataAgentImpl() => _singleton;

  final LibraryApi _libraryApi = LibraryApi(Dio());
  final SearchApi _searchApi = SearchApi(Dio());

  @override
  Future<ResultsVO?> getResult(String publishedDate) {
    return _libraryApi
        .getLibraryResponse(kApiToken, publishedDate)
        .asStream()
        .map((event) => event.results)
        .first;
  }

  @override
  Future<List<ItemsVO>?> getItemList(String query) {
    return _searchApi
        .getSearchResponse(query)
        .asStream()
        .map((event) => event.items)
        .first;
  }

  @override
  Future<List<ListsVO>?> getLists(String publishedDate) {
    return getResult(publishedDate).then((value) {
      return value?.lists;
    });
  }
}
