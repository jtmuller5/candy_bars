// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bar _$BarFromJson(Map<String, dynamic> json) => Bar(
      id: json['id'] as String?,
      text: json['text'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userId: json['user_id'] as String?,
      type: $enumDecodeNullable(_$BarTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$BarToJson(Bar instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_id': instance.userId,
      'type': _$BarTypeEnumMap[instance.type],
    };

const _$BarTypeEnumMap = {
  BarType.link: 'link',
  BarType.image: 'image',
  BarType.opinion: 'opinion',
};
