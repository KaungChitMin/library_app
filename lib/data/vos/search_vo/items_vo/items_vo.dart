import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';
import 'package:library_book/data/vos/search_vo/items_vo/search_info_vo.dart';

import 'access_info_vo.dart';
import 'sale_info_vo.dart';
import 'volume_info_vo.dart';

part 'items_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForItems)
class ItemsVO {
  @JsonKey(name: 'kind')
  @HiveField(0)
  String? kind;

  @JsonKey(name: 'id')
  @HiveField(1)
  String? id;

  @JsonKey(name: 'etag')
  @HiveField(2)
  String? etag;

  @JsonKey(name: 'selfLink')
  @HiveField(3)
  String? selfLink;

  @JsonKey(name: 'volumeInfo')
  @HiveField(4)
  VolumeInfoVO? volumeInfo;

  @JsonKey(name: 'saleInfo')
  @HiveField(5)
  SaleInfoVO? saleInfo;

  @JsonKey(name: 'accessInfo')
  @HiveField(6)
  AccessInfoVO? accessInfo;

  @JsonKey(name: 'searchInfo')
  @HiveField(7)
  SearchInfoVO? searchInfo;

  ItemsVO(
      {this.kind,
      this.id,
      this.etag,
      this.selfLink,
      this.volumeInfo,
      this.saleInfo,
      this.accessInfo,
      this.searchInfo});

  factory ItemsVO.fromJson(Map<String, dynamic> json) =>
      _$ItemsVOFromJson(json);
}
