import 'package:json_annotation/json_annotation.dart';

part 'aisle.g.dart';

@JsonSerializable(explicitToJson: true)
class Aisle {
  String? name;

  int? id;

  @JsonKey(name: 'user_id')
  String? userId;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  Aisle({
    this.name,
    this.id,
    this.createdAt,
    this.userId,
  });

  factory Aisle.fromJson(Map<String, dynamic> json) => _$AisleFromJson(json);

  Map<String, dynamic> toJson() => _$AisleToJson(this);
}
