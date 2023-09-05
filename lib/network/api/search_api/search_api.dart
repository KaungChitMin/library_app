import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../constant/api_constant.dart';
import '../../response/search_response/search_response.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: kSearchBaseUrl)
abstract class SearchAPI {
  factory SearchAPI(Dio dio) = _SearchAPI;

  @GET(kSearchEndPoint)
  Future<SearchResponse> getSearchResponse(
    @Query(kQueryParamForQuery) String search,
  );
}
