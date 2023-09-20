import 'package:json_annotation/json_annotation.dart';
part 'reading_vo.g.dart';
@JsonSerializable()
class ReadingModes {

  @JsonKey(name: 'text')
  bool? text;

  @JsonKey(name: 'image')
  bool? image;

  ReadingModes({this.text, this.image});
  factory ReadingModes.fromJson(json)=> _$ReadingModesFromJson(json);
}