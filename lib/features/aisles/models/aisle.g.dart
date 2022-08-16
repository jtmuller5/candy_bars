// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aisle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aisle _$AisleFromJson(Map<String, dynamic> json) => Aisle(
      name: json['name'] as String?,
      id: json['id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$AisleToJson(Aisle instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'user_id': instance.userId,
      'created_at': instance.createdAt?.toIso8601String(),
    };
