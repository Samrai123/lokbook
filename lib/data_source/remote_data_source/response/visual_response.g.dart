// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisualResponse _$VisualResponseFromJson(Map<String, dynamic> json) =>
    VisualResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Visual.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VisualResponseToJson(VisualResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
