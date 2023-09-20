
import 'package:json_annotation/json_annotation.dart';
part 'panelization_summary.g.dart';
@JsonSerializable()
class PanelizationSummary {
  @JsonKey(name: 'containsEpubBubbles')
  bool? containsEpubBubbles;

  @JsonKey(name: 'containsImageBubbles')
  bool? containsImageBubbles;

  @JsonKey(name: 'epubBubbleVersion')
  String? epubBubbleVersion;

  @JsonKey(name: 'imageBubbleVersion')
  String? imageBubbleVersion;

  PanelizationSummary({this.containsEpubBubbles,
    this.containsImageBubbles,
    this.epubBubbleVersion,
    this.imageBubbleVersion});
  factory PanelizationSummary.fromJson(Map<String,dynamic> json)=> _$PanelizationSummaryFromJson(json);
}