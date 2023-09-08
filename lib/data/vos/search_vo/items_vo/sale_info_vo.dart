import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

part 'sale_info_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForSaleInfo)
class SaleInfoVO {
  @JsonKey(name: 'country')
  @HiveField(0)
  String? country;

  @JsonKey(name: 'saleability')
  @HiveField(1)
  String? saleability;

  @JsonKey(name: 'isEbook')
  @HiveField(2)
  bool? isEbook;

  SaleInfoVO({
    this.country,
    this.saleability,
    this.isEbook,
  });

  factory SaleInfoVO.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoVOFromJson(json);
}
