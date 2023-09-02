import 'package:dio/dio.dart';
import 'package:library_book/constant/api_constant.dart';
import 'package:retrofit/http.dart';

import '../../response/library_response.dart';

@RestApi(baseUrl: kLibraryBaseUrl)
abstract class LibraryApi {
  factory LibraryApi(Dio dio) => LibraryApi(dio);

  @GET(kLibraryEndPoint)
  Future<LibraryResponse> getLibraryResponse(
      @Query(kQueryParamApiKey) String apiKey,
      @Query(kQueryParamPublishedDate) String publishDate);
}
