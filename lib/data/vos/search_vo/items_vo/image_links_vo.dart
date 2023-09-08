import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

part 'image_links_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForImageLinks)
class ImageLinksVO {
  @JsonKey(name: 'smallThumbnail')
  @HiveField(0)
  String? smallThumbnail;

  @JsonKey(name: 'thumbnail')
  @HiveField(1)
  String? thumbnail;

  ImageLinksVO({this.smallThumbnail, this.thumbnail});

  factory ImageLinksVO.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksVOFromJson(json);
}
