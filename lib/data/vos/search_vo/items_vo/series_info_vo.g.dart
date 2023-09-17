// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_info_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SeriesInfoVOAdapter extends TypeAdapter<SeriesInfoVO> {
  @override
  final int typeId = 17;

  @override
  SeriesInfoVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SeriesInfoVO();
  }

  @override
  void write(BinaryWriter writer, SeriesInfoVO obj) {
    writer.writeByte(0);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeriesInfoVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesInfoVO _$SeriesInfoVOFromJson(Map<String, dynamic> json) => SeriesInfoVO(
      kind: json['kind'] as String?,
      bookDisplayNumber: json['bookDisplayNumber'] as String?,
      volumeSeries: (json['volumeSeries'] as List<dynamic>?)
          ?.map((e) => VolumeSeriesVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesInfoVOToJson(SeriesInfoVO instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'bookDisplayNumber': instance.bookDisplayNumber,
      'volumeSeries': instance.volumeSeries,
    };
