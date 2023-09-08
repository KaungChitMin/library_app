import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

part 'epub_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForEpub)
class EpubVO {
  @JsonKey(name: 'isAvailable')
  @HiveField(0)
  bool? isAvailable;

  @JsonKey(name: 'acsTokenLink')
  @HiveField(1)
  String? acsTokenLink;

  EpubVO({this.isAvailable, this.acsTokenLink});

  factory EpubVO.fromJson(Map<String, dynamic> json) => _$EpubVOFromJson(json);
}
