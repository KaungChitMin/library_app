import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

part 'search_info_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForSearchInfo)
class SearchInfoVO {
  @JsonKey(name: 'textSnippet')
  @HiveField(0)
  String? textSnippet;

  SearchInfoVO(this.textSnippet);

  factory SearchInfoVO.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoVOFromJson(json);
}
