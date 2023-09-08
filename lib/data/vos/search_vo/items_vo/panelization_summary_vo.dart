import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:library_book/constant/hive_constant.dart';

part 'panelization_summary_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForPanelization)
class PanelizationSummaryVO {
  
  @JsonKey(name: 'containsEpubBubbles')
  @HiveField(0)
  bool? containsEpubBubbles;

  @JsonKey(name: 'containsImageBubbles')
  @HiveField(1)
  bool? containsImageBubbles;
  

  PanelizationSummaryVO(
      {this.containsEpubBubbles,
      this.containsImageBubbles,
     });

  factory PanelizationSummaryVO.fromJson(Map<String, dynamic> json) =>
      _$PanelizationSummaryVOFromJson(json);
}
