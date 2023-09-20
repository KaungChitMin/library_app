import 'package:json_annotation/json_annotation.dart';

part 'epub_info.g.dart';
@JsonSerializable()
class Epub {
  @JsonKey(name: 'isAvailable')
  bool? isAvailable;

  @JsonKey(name: 'acsTokenLink')
  String? acsTokenLink;

  Epub({this.isAvailable, this.acsTokenLink});
  factory Epub.fromJson(Map<String,dynamic>json)=> _$EpubFromJson(json);
}