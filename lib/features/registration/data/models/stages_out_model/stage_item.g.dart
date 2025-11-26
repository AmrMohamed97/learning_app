// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StageItem _$StageItemFromJson(Map<String, dynamic> json) => StageItem(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$StageItemToJson(StageItem instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
};
