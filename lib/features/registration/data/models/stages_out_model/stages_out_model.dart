import 'package:json_annotation/json_annotation.dart';

import 'stage_item.dart';

part 'stages_out_model.g.dart';

@JsonSerializable()
class StagesOutModel {
  bool? status;
  String? message;
  List<StageItem>? data;

  StagesOutModel({this.status, this.message, this.data});

  factory StagesOutModel.fromJson(Map<String, dynamic> json) {
    return _$StagesOutModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StagesOutModelToJson(this);
}
