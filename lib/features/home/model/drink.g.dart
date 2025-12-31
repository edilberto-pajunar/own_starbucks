// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drink _$DrinkFromJson(Map<String, dynamic> json) => Drink(
  name: json['name'] as String?,
  category: json['category'] as String?,
  description: json['description'] as String?,
  imageUrl: json['image_url'] as String?,
  baseBeverage: json['base_beverage'] as String?,
  defaultSize: json['default_size'] as String?,
  defaultIceLevel: json['default_ice_level'] as String?,
  defaultSweetnessLevel: (json['default_sweetness_level'] as num?)?.toInt(),
  isCustomizable: json['is_customizable'] as bool?,
  id: (json['id'] as num?)?.toInt(),
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  ingredients: (json['ingredients'] as List<dynamic>?)
      ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DrinkToJson(Drink instance) => <String, dynamic>{
  'name': instance.name,
  'category': instance.category,
  'description': instance.description,
  'image_url': instance.imageUrl,
  'base_beverage': instance.baseBeverage,
  'default_size': instance.defaultSize,
  'default_ice_level': instance.defaultIceLevel,
  'default_sweetness_level': instance.defaultSweetnessLevel,
  'is_customizable': instance.isCustomizable,
  'id': instance.id,
  'createdAt': instance.createdAt?.toIso8601String(),
  'ingredients': instance.ingredients,
};
