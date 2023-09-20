// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesInfo _$SeriesInfoFromJson(Map<String, dynamic> json) => SeriesInfo(
      kind: json['kind'] as String?,
      bookDisplayNumber: json['bookDisplayNumber'] as String?,
      volumeSeries: (json['volumeSeries'] as List<dynamic>?)
          ?.map((e) => VolumeSeries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesInfoToJson(SeriesInfo instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'bookDisplayNumber': instance.bookDisplayNumber,
      'volumeSeries': instance.volumeSeries,
    };
