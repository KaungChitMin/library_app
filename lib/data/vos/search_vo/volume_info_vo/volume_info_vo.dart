import 'package:json_annotation/json_annotation.dart';

import '../image_link_vo/image_links_vo.dart';
import '../industry_identifiers_vo/industry_identifiers_vo.dart';
import '../panelization_summary_vo/panelization_summary_vo.dart';
import '../reading_modes_vo/reading_modes_vo.dart';
import '../series_info_vo/series_info_vo.dart';

part 'volume_info_vo.g.dart';
@JsonSerializable()
class VolumeInfoVO {
  @JsonKey(name: 'title')
  String? title;

  @JsonKey(name: 'authors')
  List<String>? authors;

  @JsonKey(name: 'publisher')
  String? publisher;

  @JsonKey(name:'publisherDate')
  String? publishedDate;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'industryIdentifiers')
  List<IndustryIdentifiers>? industryIdentifiers;

  @JsonKey(name: 'readingModes')
  ReadingModes? readingModes;

  @JsonKey(name: 'pageCount')
  int? pageCount;

  @JsonKey(name: 'printType')
  String? printType;

  @JsonKey(name: 'categories')
  List<String>? categories;

  @JsonKey(name: 'maturityRating')
  String? maturityRating;

  @JsonKey(name: 'allowAnonLogging')
  bool? allowAnonLogging;

  @JsonKey(name: 'contentVersion')
  String? contentVersion;

  @JsonKey(name: 'panelizationSummary')
  PanelizationSummary? panelizationSummary;

  @JsonKey(name: 'imageLinks')
  ImageLinks? imageLinks;

  @JsonKey(name: 'language')
  String? language;

  @JsonKey(name: 'previewLink')
  String? previewLink;

  @JsonKey(name: 'infoLink')
  String? infoLink;

  @JsonKey(name: 'canonicalVolumeLink')
  String? canonicalVolumeLink;



  @JsonKey(name: 'seriesInfo')
  SeriesInfo? seriesInfo;

  @JsonKey(name: 'averageRating')
  int? averageRating;

  @JsonKey(name: 'ratingsCount')
  int? ratingsCount;

  @JsonKey(name: 'subtitle')
  String? subtitle;

  VolumeInfoVO({this.title,
    this.publisher,
    this.publishedDate,
    this.authors,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.seriesInfo,
    this.averageRating,
    this.ratingsCount,
    this.subtitle});

  factory VolumeInfoVO.fromJson(Map<String,dynamic>json)=> _$VolumeInfoVOFromJson(json);
}