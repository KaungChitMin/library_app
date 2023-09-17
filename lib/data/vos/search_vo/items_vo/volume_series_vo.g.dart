// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_series_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VolumeSeriesVOAdapter extends TypeAdapter<VolumeSeriesVO> {
  @override
  final int typeId = 18;

  @override
  VolumeSeriesVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeSeriesVO(
      seriesId: fields[0] as String?,
      seriesBookType: fields[1] as String?,
      orderNumber: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, VolumeSeriesVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.seriesId)
      ..writeByte(1)
      ..write(obj.seriesBookType)
      ..writeByte(2)
      ..write(obj.orderNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeSeriesVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeSeriesVO _$VolumeSeriesVOFromJson(Map<String, dynamic> json) =>
    VolumeSeriesVO(
      seriesId: json['seriesId'] as String?,
      seriesBookType: json['seriesBookType'] as String?,
      orderNumber: json['orderNumber'] as int?,
    );

Map<String, dynamic> _$VolumeSeriesVOToJson(VolumeSeriesVO instance) =>
    <String, dynamic>{
      'seriesId': instance.seriesId,
      'seriesBookType': instance.seriesBookType,
      'orderNumber': instance.orderNumber,
    };
