import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../constant/api_constant.dart';
import '../../response/library_response/library_response.dart';

part 'library_api.g.dart';

@RestApi(baseUrl: kLibraryBaseUrl)
abstract class LibraryApi {
  factory LibraryApi(Dio dio) => _LibraryApi(dio);

  @GET(kLibraryEndPoint)
  Future<LibraryResponse> getLibraryResponse(
      @Query(kQueryParamApiKey) String apiKey,
      @Query(kQueryParamPublishedDate) String publishedDate);
}
