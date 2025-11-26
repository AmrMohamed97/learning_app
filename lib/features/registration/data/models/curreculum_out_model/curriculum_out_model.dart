import 'package:json_annotation/json_annotation.dart';

import 'curriculum_item.dart';

part 'curriculum_out_model.g.dart';

@JsonSerializable()
class CurriculumOutModel {
  bool? status;
  String? message;
  List<CurriculumItem>? data;

  CurriculumOutModel({this.status, this.message, this.data});

  factory CurriculumOutModel.fromJson(Map<String, dynamic> json) {
    return _$CurriculumOutModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CurriculumOutModelToJson(this);
}
