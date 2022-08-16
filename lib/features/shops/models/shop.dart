import 'package:json_annotation/json_annotation.dart';

part 'shop.g.dart';

@JsonSerializable(explicitToJson: true)
class Shop {
  String? name;

  String? id;

  @JsonKey(name: 'user_id')
  String? userId;

  @JsonKey(name: 'last_aisle')
  int? lastAisle;

  Shop({
    this.name,
    this.id,
    this.userId,
    this.lastAisle,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => _$ShopFromJson(json);

  Map<String, dynamic> toJson() => _$ShopToJson(this);
}
