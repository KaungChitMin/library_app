import 'package:json_annotation/json_annotation.dart';

import '../list_price_vo/list_price_vo.dart';

part 'offers_vo.g.dart';

@JsonSerializable()
class Offers {
  @JsonKey(name: 'finskyOfferType')
  int? finskyOfferType;

  @JsonKey(name: 'listPrice')
  ListPrice? listPrice;

  @JsonKey(name: 'retailPrice')
  ListPrice? retailPrice;

  Offers({this.finskyOfferType, this.listPrice, this.retailPrice});

  factory Offers.fromJson(Map<String, dynamic> json) => _$OffersFromJson(json);
}
