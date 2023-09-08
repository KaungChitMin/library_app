import 'package:dio/dio.dart';
import 'package:library_book/constant/api_constant.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/results_vo.dart';
import 'package:library_book/network/api/library_api/library_api.dart';
import '../../data/vos/search_vo/items_vo/items_vo.dart';
import '../api/search_api/search_api.dart';
import 'library_data_agent.dart';

class LibraryDataAgentImpl extends LibraryDataAgent {
  late LibraryApi _libraryApi;
  late SearchApi _searchApi;

  LibraryDataAgentImpl._() {
    _libraryApi = LibraryApi(Dio());
    _searchApi = SearchApi(Dio());
  }

  static final LibraryDataAgentImpl _singleton = LibraryDataAgentImpl._();

  factory LibraryDataAgentImpl() => _singleton;

  @override
  Future<ResultsVO?> getResultsVO(String publishDate) => _libraryApi
      .getLibraryResponse(kApiToken, publishDate)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<ItemsVO>?> getItemList(String query) => _searchApi
      .getSearchResponse(query)
      .asStream()
      .map((event) => event.items)
      .first;
}
