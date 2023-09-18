// import 'package:dio/dio.dart';
// import 'package:library_book/constant/api_constant.dart';
// import 'package:library_book/network/api/library_api/library_api.dart';
// import '../../data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
// import '../../data/vos/home_page_vo/results_vo/result_vo/result_vo.dart';
// import '../../data/vos/search_vo/items_vo/items_vo.dart';
// import '../api/search_api/search_api.dart';
// import 'library_data_agent.dart';
//
// class LibraryDataAgentImpl extends LibraryDataAgent {
//   late LibraryApi _libraryApi;
//   late SearchApi _searchApi;
//
//   LibraryDataAgentImpl._() {
//     _libraryApi = LibraryApi(Dio());
//     _searchApi = SearchApi(Dio());
//   }
//
//   static final LibraryDataAgentImpl _singleton = LibraryDataAgentImpl._();
//
//   factory LibraryDataAgentImpl() => _singleton;
//
//   @override
//   Future<ResultsVO?> getResultsVO(String publishDate) => _libraryApi
//       .getLibraryResponse(kApiToken, publishDate)
//       .asStream()
//       .map((event) => event.results)
//       .first;
//
//   @override
//   Future<List<ItemsVO>?> getItemList(String query) => _searchApi
//       .getSearchResponse(query)
//       .asStream()
//       .map((event) => event.items)
//       .first;
//
//   @override
//   Future<List<ListsVO>?> getListsList(String publishDate) =>
//       //getResultsVO(publishDate).asStream().map((event) => event!.lists).first;
//       getResultsVO(publishDate).then((value) {
//         return (value!.lists);
//       });
// }

import 'package:dio/dio.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/lists_vo/lists_vo.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/result_vo/result_vo.dart';
import 'package:library_book/network/api/search_api/search_api.dart';

import '../../constant/api_constant.dart';
import '../../data/vos/search_vo/items_vo/items_vo.dart';
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
  Future<List<ItemsVO>?> getItemList(String search) {
    return _searchApi
        .getSearchResponse(search)
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
