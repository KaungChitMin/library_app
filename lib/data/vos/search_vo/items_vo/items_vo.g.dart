// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsVOAdapter extends TypeAdapter<ItemsVO> {
  @override
  final int typeId = 15;

  @override
  ItemsVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemsVO(
      kind: fields[0] as String?,
      id: fields[1] as String?,
      etag: fields[2] as String?,
      selfLink: fields[3] as String?,
      volumeInfo: fields[4] as VolumeInfoVO?,
      saleInfo: fields[5] as SaleInfoVO?,
      accessInfo: fields[6] as AccessInfoVO?,
      searchInfo: fields[7] as SearchInfoVO?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemsVO obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.kind)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.etag)
      ..writeByte(3)
      ..write(obj.selfLink)
      ..writeByte(4)
      ..write(obj.volumeInfo)
      ..writeByte(5)
      ..write(obj.saleInfo)
      ..writeByte(6)
      ..write(obj.accessInfo)
      ..writeByte(7)
      ..write(obj.searchInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemsVO _$ItemsVOFromJson(Map<String, dynamic> json) => ItemsVO(
      kind: json['kind'] as String?,
      id: json['id'] as String?,
      etag: json['etag'] as String?,
      selfLink: json['selfLink'] as String?,
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfoVO.fromJson(json['volumeInfo'] as Map<String, dynamic>),
      saleInfo: json['saleInfo'] == null
          ? null
          : SaleInfoVO.fromJson(json['saleInfo'] as Map<String, dynamic>),
      accessInfo: json['accessInfo'] == null
          ? null
          : AccessInfoVO.fromJson(json['accessInfo'] as Map<String, dynamic>),
      searchInfo: json['searchInfo'] == null
          ? null
          : SearchInfoVO.fromJson(json['searchInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemsVOToJson(ItemsVO instance) => <String, dynamic>{
      'kind': instance.kind,
      'id': instance.id,
      'etag': instance.etag,
      'selfLink': instance.selfLink,
      'volumeInfo': instance.volumeInfo,
      'saleInfo': instance.saleInfo,
      'accessInfo': instance.accessInfo,
      'searchInfo': instance.searchInfo,
    };
