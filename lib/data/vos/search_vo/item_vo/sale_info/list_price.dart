import 'package:json_annotation/json_annotation.dart';

part 'list_price.g.dart';
@JsonSerializable()
class ListPrice {
  @JsonKey(name: 'amount')
  int? amount;

  @JsonKey(name: 'currencyCode')
  String? currencyCode;

  ListPrice({this.amount, this.currencyCode});
  factory ListPrice.fromJson(Map<String,dynamic> json)=> _$ListPriceFromJson(json);

  }