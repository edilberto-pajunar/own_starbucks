// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  type: json['type'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  unit: json['unit'] as String?,
  isRemovable: json['is_removable'] as bool?,
);

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'quantity': instance.quantity,
      'unit': instance.unit,
      'is_removable': instance.isRemovable,
    };
