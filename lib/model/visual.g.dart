// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Visual _$VisualFromJson(Map<String, dynamic> json) => Visual(
      visualId: json['_id'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      vId: json['vId'] as int? ?? 0,
    )..categorys = (json['category'] as List<dynamic>?)
        ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$VisualToJson(Visual instance) => <String, dynamic>{
      'vId': instance.vId,
      '_id': instance.visualId,
      'description': instance.description,
      'image': instance.image,
      'category': instance.categorys,
    };
