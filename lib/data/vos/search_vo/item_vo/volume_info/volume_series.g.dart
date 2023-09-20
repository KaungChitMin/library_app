// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeSeries _$VolumeSeriesFromJson(Map<String, dynamic> json) => VolumeSeries(
      seriesId: json['seriesId'] as String?,
      seriesBookType: json['seriesBookType'] as String?,
      orderNumber: json['orderNumber'] as int?,
    );

Map<String, dynamic> _$VolumeSeriesToJson(VolumeSeries instance) =>
    <String, dynamic>{
      'seriesId': instance.seriesId,
      'seriesBookType': instance.seriesBookType,
      'orderNumber': instance.orderNumber,
    };
