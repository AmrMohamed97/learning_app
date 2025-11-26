// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curriculum_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurriculumOutModel _$CurriculumOutModelFromJson(Map<String, dynamic> json) =>
    CurriculumOutModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CurriculumItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CurriculumOutModelToJson(CurriculumOutModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
