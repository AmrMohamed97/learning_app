import 'sub_craft_model.dart';

class CraftModel {
  String? craft;
  List<SubCraftModel>? subCrafts;

  CraftModel({this.craft, this.subCrafts});

  factory CraftModel.fromJson(Map<String, dynamic> json) => CraftModel(
    craft: json['craft'] as String?,
    subCrafts: (json['sub_crafts'] as List<dynamic>?)
        ?.map((e) => SubCraftModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'craft': craft,
    'sub_crafts': subCrafts?.map((e) => e.toJson()).toList(),
  };
}
