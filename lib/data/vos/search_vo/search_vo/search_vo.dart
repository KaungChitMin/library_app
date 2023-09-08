import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

import '../items_vo/items_vo.dart';

part 'search_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForSearch)
class SearchVO {
  @JsonKey(name: 'kind')
  @HiveField(0)
  String? kind;

  @JsonKey(name: 'totalItems')
  @HiveField(1)
  int? totalItems;

  @JsonKey(name: 'items')
  @HiveField(2)
  List<ItemsVO>? items;

  SearchVO(this.kind, this.totalItems, this.items);

  factory SearchVO.fromJson(Map<String, dynamic> json) =>
      _$SearchVOFromJson(json);
}
