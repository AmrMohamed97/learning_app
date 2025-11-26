// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stages_out_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StagesOutModel _$StagesOutModelFromJson(Map<String, dynamic> json) =>
    StagesOutModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => StageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StagesOutModelToJson(StagesOutModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
