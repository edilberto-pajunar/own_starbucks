// To parse this JSON data, do
//
//     final drink = drinkFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:own_starbucks/features/home/model/ingredient.dart';

part 'drink.g.dart';

Drink drinkFromJson(String str) => Drink.fromJson(json.decode(str));

String drinkToJson(Drink data) => json.encode(data.toJson());

@JsonSerializable()
class Drink {
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image_url")
  final String? imageUrl;
  @JsonKey(name: "base_beverage")
  final String? baseBeverage;
  @JsonKey(name: "default_size")
  final String? defaultSize;
  @JsonKey(name: "default_ice_level")
  final String? defaultIceLevel;
  @JsonKey(name: "default_sweetness_level")
  final int? defaultSweetnessLevel;
  @JsonKey(name: "is_customizable")
  final bool? isCustomizable;
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "createdAt")
  final DateTime? createdAt;
  @JsonKey(name: "ingredients")
  final List<Ingredient>? ingredients;

  Drink({
    this.name,
    this.category,
    this.description,
    this.imageUrl,
    this.baseBeverage,
    this.defaultSize,
    this.defaultIceLevel,
    this.defaultSweetnessLevel,
    this.isCustomizable,
    this.id,
    this.createdAt,
    this.ingredients,
  });

  Drink copyWith({
    String? name,
    String? category,
    String? description,
    String? imageUrl,
    String? baseBeverage,
    String? defaultSize,
    String? defaultIceLevel,
    int? defaultSweetnessLevel,
    bool? isCustomizable,
    int? id,
    DateTime? createdAt,
    List<Ingredient>? ingredients,
  }) => Drink(
    name: name ?? this.name,
    category: category ?? this.category,
    description: description ?? this.description,
    imageUrl: imageUrl ?? this.imageUrl,
    baseBeverage: baseBeverage ?? this.baseBeverage,
    defaultSize: defaultSize ?? this.defaultSize,
    defaultIceLevel: defaultIceLevel ?? this.defaultIceLevel,
    defaultSweetnessLevel: defaultSweetnessLevel ?? this.defaultSweetnessLevel,
    isCustomizable: isCustomizable ?? this.isCustomizable,
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    ingredients: ingredients ?? this.ingredients,
  );

  factory Drink.fromJson(Map<String, dynamic> json) => _$DrinkFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkToJson(this);
}
