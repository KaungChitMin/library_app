
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/data/vos/search_vo/item_vo/volume_info/volume_series.dart';
part 'series_info.g.dart';
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