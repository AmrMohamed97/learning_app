import 'package:json_annotation/json_annotation.dart';

part 'curriculum_item.g.dart';

@JsonSerializable()
class CurriculumItem {
  int? id;
  String? name;
  String? description;

  CurriculumItem({this.id, this.name, this.description});

  factory CurriculumItem.fromJson(Map<String, dynamic> json) =>
      _$CurriculumItemFromJson(json);

  Map<String, dynamic> toJson() => _$CurriculumItemToJson(this);
}
