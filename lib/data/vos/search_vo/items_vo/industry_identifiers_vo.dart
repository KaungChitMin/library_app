import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

part 'industry_identifiers_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForIndustry)
class IndustryIdentifiersVO {
  @JsonKey(name: 'type')
  @HiveField(0)
  String? type;

  @JsonKey(name: 'identifier')
  @HiveField(1)
  String? identifier;

  IndustryIdentifiersVO({this.type, this.identifier});

  factory IndustryIdentifiersVO.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersVOFromJson(json);
}
