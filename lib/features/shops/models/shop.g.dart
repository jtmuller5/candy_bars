// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shop _$ShopFromJson(Map<String, dynamic> json) => Shop(
      name: json['name'] as String?,
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      lastAisle: json['last_aisle'] as int?,
    );

Map<String, dynamic> _$ShopToJson(Shop instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'user_id': instance.userId,
      'last_aisle': instance.lastAisle,
    };
