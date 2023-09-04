import 'package:json_annotation/json_annotation.dart';

import '../list_price_vo/list_price_vo.dart';
import '../offers_vo/offers_vo.dart';


part 'sale_info_vo.g.dart';

@JsonSerializable()
class SaleInfo {
  @JsonKey(name: 'country')
  String? country;

  @JsonKey(name: 'saleability')
  String? saleability;

  @JsonKey(name: 'isEbook')
  bool? isEbook;

  @JsonKey(name: 'listPrice')
  ListPrice? listPrice;

  @JsonKey(name: 'retailPrice')
  ListPrice? retailPrice;

  @JsonKey(name: 'buyLink')
  String? buyLink;

  @JsonKey(name: 'offers')
  List<Offers>? offers;

  SaleInfo(
      {this.country,
      this.saleability,
      this.isEbook,
      this.listPrice,
      this.retailPrice,
      this.buyLink,
      this.offers});

  factory SaleInfo.fromJson(Map<String, dynamic> json) =>
      _$SaleInfoFromJson(json);
}
