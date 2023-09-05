import 'package:json_annotation/json_annotation.dart';

import '../../../data/vos/home_page_vo/results_vo/results_vo.dart';

part 'library_response.g.dart';

@JsonSerializable()
class LibraryResponse {
  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'copyright')
  String? copyright;

  @JsonKey(name: 'name_results')
  int? numResults;

  @JsonKey(name: 'results')
  ResultsVO? results;

  LibraryResponse({this.status, this.copyright, this.numResults, this.results});

  factory LibraryResponse.fromJson(Map<String, dynamic> json) =>
      _$LibraryResponseFromJson(json);
}
