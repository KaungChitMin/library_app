import 'package:json_annotation/json_annotation.dart';

part 'pdf_vo.g.dart';

@JsonSerializable()
class Pdf {
  @JsonKey(name: 'isAvailable')
  bool? isAvailable;

  @JsonKey(name: 'acsTokenLink')
  String? acsTokenLink;

  Pdf({this.isAvailable, this.acsTokenLink});

  factory Pdf.fromJson(Map<String, dynamic> json) => _$PdfFromJson(json);
}
