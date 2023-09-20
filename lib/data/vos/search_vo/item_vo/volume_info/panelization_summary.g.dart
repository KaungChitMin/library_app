// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panelization_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PanelizationSummary _$PanelizationSummaryFromJson(Map<String, dynamic> json) =>
    PanelizationSummary(
      containsEpubBubbles: json['containsEpubBubbles'] as bool?,
      containsImageBubbles: json['containsImageBubbles'] as bool?,
      epubBubbleVersion: json['epubBubbleVersion'] as String?,
      imageBubbleVersion: json['imageBubbleVersion'] as String?,
    );

Map<String, dynamic> _$PanelizationSummaryToJson(
        PanelizationSummary instance) =>
    <String, dynamic>{
      'containsEpubBubbles': instance.containsEpubBubbles,
      'containsImageBubbles': instance.containsImageBubbles,
      'epubBubbleVersion': instance.epubBubbleVersion,
      'imageBubbleVersion': instance.imageBubbleVersion,
    };
