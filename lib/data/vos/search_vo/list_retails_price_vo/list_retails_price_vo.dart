import 'package:json_annotation/json_annotation.dart';

part 'list_retails_price_vo.g.dart';

@JsonSerializable()
class ListRetailsPrice {
  @JsonKey(name: 'amount')
  int? amountInMicros;

  @JsonKey(name: 'currencyCode')
  String? currencyCode;

  ListRetailsPrice({this.amountInMicros, this.currencyCode});

 factory ListRetailsPrice.fromJson(Map<String, dynamic> json) => _$ListRetailsPriceFromJson(json);
}
