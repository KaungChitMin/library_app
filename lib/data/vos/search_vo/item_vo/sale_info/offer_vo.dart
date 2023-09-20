import 'package:json_annotation/json_annotation.dart';

import 'list_price.dart';

part 'offer_vo.g.dart';
@JsonSerializable()
class Offers {
  @JsonKey(name: 'finskyOfferType')
  int? finskyOfferType;

  @JsonKey(name:'listPrice' )
  ListPrice? listPrice;

  @JsonKey(name:'retailPrice' )
  ListPrice? retailPrice;

  Offers({this.finskyOfferType, this.listPrice, this.retailPrice});
  factory Offers.fromJson(Map<String,dynamic> json)=> _$OffersFromJson(json);
}