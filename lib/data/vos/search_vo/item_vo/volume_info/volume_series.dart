import 'package:json_annotation/json_annotation.dart';
part 'volume_series.g.dart';
@JsonSerializable()
class VolumeSeries {
  @JsonKey(name: 'seriesId')
  String? seriesId;

  @JsonKey(name: 'seriesBookType')
  String? seriesBookType;

  @JsonKey(name: 'orderNumber')
  int? orderNumber;

  VolumeSeries({this.seriesId, this.seriesBookType, this.orderNumber});

  factory VolumeSeries.fromJson(Map<String,dynamic>json)=> _$VolumeSeriesFromJson(json);
}