import 'package:dio/dio.dart';
import 'package:library_book/constant/api_constant.dart';
import 'package:library_book/data/vos/home_page_vo/results_vo/books_vo.dart';

import 'package:library_book/data/vos/home_page_vo/results_vo/results_vo.dart';
import 'package:library_book/network/api/library_api/library_api.dart';

import 'library_data_agent.dart';

class LibraryDataAgentImpl extends LibraryDataAgent {
  late LibraryApi _api;

  LibraryDataAgentImpl._() {
    _api = LibraryApi(Dio());
  }

  static final LibraryDataAgentImpl _singleton = LibraryDataAgentImpl._();

  factory LibraryDataAgentImpl() => _singleton;


  @override
  Future<ResultsVO?> getResultsFromNetWork(String publishDate) => _api
      .getLibraryResponse(kApiToken, publishDate)
      .asStream()
      .map((event) => event.results)
      .first;
}
