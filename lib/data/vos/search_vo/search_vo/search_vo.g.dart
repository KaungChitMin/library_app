// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchVOAdapter extends TypeAdapter<SearchVO> {
  @override
  final int typeId = 6;

  @override
  SearchVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchVO(
      fields[0] as String?,
      fields[1] as int?,
      (fields[2] as List?)?.cast<ItemsVO>(),
    );
  }

  @override
  void write(BinaryWriter writer, SearchVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.kind)
      ..writeByte(1)
      ..write(obj.totalItems)
      ..writeByte(2)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchVO _$SearchVOFromJson(Map<String, dynamic> json) => SearchVO(
      json['kind'] as String?,
      json['totalItems'] as int?,
      (json['items'] as List<dynamic>?)
          ?.map((e) => ItemsVO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchVOToJson(SearchVO instance) => <String, dynamic>{
      'kind': instance.kind,
      'totalItems': instance.totalItems,
      'items': instance.items,
    };
