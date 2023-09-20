import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'list_price.dart';
import 'offer_vo.dart';
part 'sale_info.g.dart';
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

  SaleInfo({this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
    this.retailPrice,
    this.buyLink,
    this.offers});

  factory SaleInfo.fromJson(Map<String,dynamic> json)=> _$SaleInfoFromJson(json);
}