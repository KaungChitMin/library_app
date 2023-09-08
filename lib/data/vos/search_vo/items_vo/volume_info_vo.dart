import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

import '../industry_identifiers_vo/industry_identifiers_vo.dart';
import 'image_links_vo.dart';
import 'panelization_summary_vo.dart';
import 'reading_modes_vo.dart';
import 'series_info_vo.dart';

part 'volume_info_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForVolumeInfo)
class VolumeInfoVO {
  @JsonKey(name: 'title')
  @HiveField(0)
  String? title;

  @JsonKey(name: 'publisherDate')
  @HiveField(3)
  String? publishedDate;

  @JsonKey(name: 'industryIdentifiers')
  @HiveField(5)
  List<IndustryIdentifiersVO>? industryIdentifiers;

  @JsonKey(name: 'readingModes')
  @HiveField(6)
  ReadingModesVO? readingModes;

  @JsonKey(name: 'pageCount')
  @HiveField(7)
  int? pageCount;

  @JsonKey(name: 'printType')
  @HiveField(8)
  String? printType;

  @JsonKey(name: 'categories')
  @HiveField(9)
  List<String>? categories;

  @JsonKey(name: 'maturityRating')
  @HiveField(10)
  String? maturityRating;

  @JsonKey(name: 'allowAnonLogging')
  @HiveField(11)
  bool? allowAnonLogging;

  @JsonKey(name: 'contentVersion')
  @HiveField(12)
  String? contentVersion;

  @JsonKey(name: 'panelizationSummary')
  @HiveField(13)
  PanelizationSummaryVO? panelizationSummary;

  @JsonKey(name: 'imageLinks')
  @HiveField(14)
  ImageLinksVO? imageLinks;

  @JsonKey(name: 'language')
  @HiveField(15)
  String? language;

  @JsonKey(name: 'previewLink')
  @HiveField(16)
  String? previewLink;

  @JsonKey(name: 'infoLink')
  @HiveField(17)
  String? infoLink;

  @JsonKey(name: 'canonicalVolumeLink')
  @HiveField(18)
  String? canonicalVolumeLink;

  @JsonKey(name: 'seriesInfo')
  @HiveField(19)
  SeriesInfoVO? seriesInfo;

  @JsonKey(name: 'averageRating')
  @HiveField(20)
  int? averageRating;

  @JsonKey(name: 'ratingsCount')
  @HiveField(21)
  int? ratingsCount;

  @JsonKey(name: 'subtitle')
  @HiveField(22)
  String? subtitle;

  VolumeInfoVO(
      {this.title,
      this.publishedDate,
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

  factory VolumeInfoVO.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoVOFromJson(json);
}
