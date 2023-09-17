import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

part 'volume_series_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForVolumeSeries)
class VolumeSeriesVO {
  @JsonKey(name: 'seriesId')
  @HiveField(0)
  String? seriesId;

  @JsonKey(name: 'seriesBookType')
  @HiveField(1)
  String? seriesBookType;

  @JsonKey(name: 'orderNumber')
  @HiveField(2)
  int? orderNumber;

  VolumeSeriesVO({this.seriesId, this.seriesBookType, this.orderNumber});

  factory VolumeSeriesVO.fromJson(Map<String, dynamic> json) =>
      _$VolumeSeriesVOFromJson(json);
}
