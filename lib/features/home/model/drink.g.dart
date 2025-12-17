// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drink _$DrinkFromJson(Map<String, dynamic> json) => Drink(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  price: json['price'] as num?,
  category: json['category'] as String?,
  calories: (json['calories'] as num?)?.toInt(),
);

Map<String, dynamic> _$DrinkToJson(Drink instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'image': instance.image,
  'price': instance.price,
  'category': instance.category,
  'calories': instance.calories,
};
