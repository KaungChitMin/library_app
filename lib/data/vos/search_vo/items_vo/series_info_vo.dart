import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/data/vos/search_vo/items_vo/volume_series_vo.dart';

part 'series_info_vo.g.dart';
@JsonSerializable()
class SeriesInfoVO {

  @JsonKey(name: 'kind')
  String? kind;

  @JsonKey(name: 'bookDisplayNumber')
  String? bookDisplayNumber;

  @JsonKey(name: 'volumeSeries')
  List<VolumeSeriesVO>? volumeSeries;

  SeriesInfoVO({this.kind, this.bookDisplayNumber, this.volumeSeries});

  factory SeriesInfoVO.fromJson(Map<String,dynamic> json)=> _$SeriesInfoVOFromJson(json);
}