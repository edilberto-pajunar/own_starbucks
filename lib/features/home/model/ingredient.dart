// To parse this JSON data, do
//
//     final ingredient = ingredientFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'ingredient.g.dart';

Ingredient ingredientFromJson(String str) =>
    Ingredient.fromJson(json.decode(str));

String ingredientToJson(Ingredient data) => json.encode(data.toJson());

@JsonSerializable()
class Ingredient {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "quantity")
  final int? quantity;
  @JsonKey(name: "unit")
  final String? unit;
  @JsonKey(name: "is_removable")
  final bool? isRemovable;

  Ingredient({
    this.id,
    this.name,
    this.type,
    this.quantity,
    this.unit,
    this.isRemovable,
  });

  Ingredient copyWith({
    int? id,
    String? name,
    String? type,
    int? quantity,
    String? unit,
    bool? isRemovable,
  }) => Ingredient(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    quantity: quantity ?? this.quantity,
    unit: unit ?? this.unit,
    isRemovable: isRemovable ?? this.isRemovable,
  );

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}
