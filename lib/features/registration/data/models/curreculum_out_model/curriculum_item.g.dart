// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurriculumItem _$CurriculumItemFromJson(Map<String, dynamic> json) =>
    CurriculumItem(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CurriculumItemToJson(CurriculumItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
