// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aisle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Aisle _$AisleFromJson(Map<String, dynamic> json) => Aisle(
      name: json['name'] as String?,
      id: json['id'] as String?,
      number: json['number'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      userId: json['user_id'] as String?,
      lastBar: json['last_bar'] as int?,
    );

Map<String, dynamic> _$AisleToJson(Aisle instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'number': instance.number,
      'user_id': instance.userId,
      'created_at': instance.createdAt?.toIso8601String(),
      'last_bar': instance.lastBar,
    };
