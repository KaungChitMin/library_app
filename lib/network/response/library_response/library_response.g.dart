// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LibraryResponse _$LibraryResponseFromJson(Map<String, dynamic> json) =>
    LibraryResponse(
      status: json['status'] as String?,
      copyright: json['copyright'] as String?,
      numResults: json['name_results'] as int?,
      results: json['results'] == null
          ? null
          : ResultsVO.fromJson(json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LibraryResponseToJson(LibraryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'copyright': instance.copyright,
      'name_results': instance.numResults,
      'results': instance.results,
    };
