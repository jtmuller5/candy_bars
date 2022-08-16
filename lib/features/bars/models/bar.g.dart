// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bar _$BarFromJson(Map<String, dynamic> json) => Bar(
      id: json['id'] as String?,
      text: json['text'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      userId: json['userId'] as String?,
      type: $enumDecodeNullable(_$BarTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$BarToJson(Bar instance) => <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'userId': instance.userId,
      'type': _$BarTypeEnumMap[instance.type],
    };

const _$BarTypeEnumMap = {
  BarType.link: 'link',
  BarType.image: 'image',
  BarType.opinion: 'opinion',
};
