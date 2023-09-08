import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

import 'epub_vo.dart';

part 'access_info_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForAccessInfo)
class AccessInfoVO {
  @JsonKey(name: 'country')
  @HiveField(0)
  String? country;

  @JsonKey(name: 'viewability')
  @HiveField(1)
  String? viewability;

  @JsonKey(name: 'embeddable')
  @HiveField(2)
  bool? embeddable;

  @JsonKey(name: 'publicDomain')
  @HiveField(3)
  bool? publicDomain;

  @JsonKey(name: 'textToSpeechPermission')
  @HiveField(4)
  String? textToSpeechPermission;

  @JsonKey(name: 'epub')
  @HiveField(5)
  EpubVO? epub;

  @JsonKey(name: 'pdf')
  @HiveField(6)
  EpubVO? pdf;

  @JsonKey(name: 'webReaderLink')
  @HiveField(7)
  String? webReaderLink;

  @JsonKey(name: 'accessViewStatus')
  @HiveField(8)
  String? accessViewStatus;

  @JsonKey(name: 'quoteSharingAllowed')
  @HiveField(9)
  bool? quoteSharingAllowed;

  AccessInfoVO(
      {this.country,
      this.viewability,
      this.embeddable,
      this.publicDomain,
      this.textToSpeechPermission,
      this.epub,
      this.pdf,
      this.webReaderLink,
      this.accessViewStatus,
      this.quoteSharingAllowed});

  factory AccessInfoVO.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoVOFromJson(json);
}
