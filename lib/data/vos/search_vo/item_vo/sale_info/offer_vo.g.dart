// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offers _$OffersFromJson(Map<String, dynamic> json) => Offers(
      finskyOfferType: json['finskyOfferType'] as int?,
      listPrice: json['listPrice'] == null
          ? null
          : ListPrice.fromJson(json['listPrice'] as Map<String, dynamic>),
      retailPrice: json['retailPrice'] == null
          ? null
          : ListPrice.fromJson(json['retailPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OffersToJson(Offers instance) => <String, dynamic>{
      'finskyOfferType': instance.finskyOfferType,
      'listPrice': instance.listPrice,
      'retailPrice': instance.retailPrice,
    };
