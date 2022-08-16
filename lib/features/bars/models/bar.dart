import 'package:json_annotation/json_annotation.dart';

part 'bar.g.dart';

@JsonSerializable(explicitToJson: true)
class Bar {
  String? id;

  String? text;

  @JsonKey(name: 'created_at')
  DateTime? createdAt;

  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  @JsonKey(name: 'user_id')
  String? userId;

  BarType? type;

  Bar({
    this.id,
    this.text,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.type,
  });

  factory Bar.fromJson(Map<String, dynamic> json) => _$BarFromJson(json);

  Map<String, dynamic> toJson() => _$BarToJson(this);
}

enum BarType {
  link,
  image,
  opinion,
}
