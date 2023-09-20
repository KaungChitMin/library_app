import 'package:json_annotation/json_annotation.dart';
part 'image_link.g.dart';
@JsonSerializable()
class ImageLinks {
  @JsonKey(name: 'smallThumbnail')
  String? smallThumbnail;

  @JsonKey(name: 'thumbnail')
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});
  factory ImageLinks.fromJson(Map<String,dynamic> json)=> _$ImageLinksFromJson(json);
}