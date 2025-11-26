import 'package:json_annotation/json_annotation.dart';

part 'stage_item.g.dart';

@JsonSerializable()
class StageItem {
  int? id;
  String? name;
  String? description;

  StageItem({this.id, this.name, this.description});

  factory StageItem.fromJson(Map<String, dynamic> json) =>
      _$StageItemFromJson(json);

  Map<String, dynamic> toJson() => _$StageItemToJson(this);
}
