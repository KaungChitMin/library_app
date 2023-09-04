// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_retails_price_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListRetailsPrice _$ListRetailsPriceFromJson(Map<String, dynamic> json) =>
    ListRetailsPrice(
      amountInMicros: json['amount'] as int?,
      currencyCode: json['currencyCode'] as String?,
    );

Map<String, dynamic> _$ListRetailsPriceToJson(ListRetailsPrice instance) =>
    <String, dynamic>{
      'amount': instance.amountInMicros,
      'currencyCode': instance.currencyCode,
    };
