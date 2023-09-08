import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

part 'reading_modes_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForReadingModes)
class ReadingModesVO {
  @JsonKey(name: 'text')
  @HiveField(0)
  bool? text;

  @JsonKey(name: 'image')
  @HiveField(1)
  bool? image;

  ReadingModesVO({this.text, this.image});

  factory ReadingModesVO.fromJson(json) => _$ReadingModesVOFromJson(json);
}
