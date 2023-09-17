// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry_identifiers_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IndustryIdentifiersVOAdapter extends TypeAdapter<IndustryIdentifiersVO> {
  @override
  final int typeId = 13;

  @override
  IndustryIdentifiersVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IndustryIdentifiersVO(
      type: fields[0] as String?,
      identifier: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, IndustryIdentifiersVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.identifier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndustryIdentifiersVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndustryIdentifiersVO _$IndustryIdentifiersVOFromJson(
        Map<String, dynamic> json) =>
    IndustryIdentifiersVO(
      type: json['type'] as String?,
      identifier: json['identifier'] as String?,
    );

Map<String, dynamic> _$IndustryIdentifiersVOToJson(
        IndustryIdentifiersVO instance) =>
    <String, dynamic>{
      'type': instance.type,
      'identifier': instance.identifier,
    };
