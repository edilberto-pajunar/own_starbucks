// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_drink.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomDrink _$CustomDrinkFromJson(Map<String, dynamic> json) => CustomDrink(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  baseDrink: json['base_drink'] == null
      ? null
      : Drink.fromJson(json['base_drink'] as Map<String, dynamic>),
  milkType: json['milk_type'] as String?,
  sugarLevel: json['sugar_level'] as String?,
  cupSize: json['cup_size'] as String?,
  extras: (json['extras'] as List<dynamic>?)?.map((e) => e as String).toList(),
  totalPrice: json['total_price'] as num?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$CustomDrinkToJson(CustomDrink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_drink': instance.baseDrink?.toJson(),
      'milk_type': instance.milkType,
      'sugar_level': instance.sugarLevel,
      'cup_size': instance.cupSize,
      'extras': instance.extras,
      'total_price': instance.totalPrice,
      'created_at': instance.createdAt?.toIso8601String(),
    };
