import 'package:json_annotation/json_annotation.dart';

import '../volume_series_vo/volume_series_vo.dart';
part 'series_info_vo.g.dart';
@JsonSerializable()
class SeriesInfo {

  @JsonKey(name: 'kind')
  String? kind;

  @JsonKey(name: 'bookDisplayNumber')
  String? bookDisplayNumber;

  @JsonKey(name: 'volumeSeries')
  List<VolumeSeries>? volumeSeries;

  SeriesInfo({this.kind, this.bookDisplayNumber, this.volumeSeries});

  factory SeriesInfo.fromJson(Map<String,dynamic> json)=> _$SeriesInfoFromJson(json);
}