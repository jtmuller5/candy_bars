import 'package:json_annotation/json_annotation.dart';

part 'aisle.g.dart';

@JsonSerializable(explicitToJson: true)
class Aisle {
  String? name;

  String? id;

  Aisle({this.name, this.id});

  factory Aisle.fromJson(Map<String, dynamic> json) => _$AisleFromJson(json);

  Map<String, dynamic> toJson() => _$AisleToJson(this);
}
