// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customized_drink.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomizedDrink _$CustomizedDrinkFromJson(Map<String, dynamic> json) =>
    CustomizedDrink(
      id: json['id'] as String?,
      customName: json['customName'] as String?,
      baseDrink: json['baseDrink'] as String?,
      milkType: json['milkType'] as String?,
      sugarLevel: json['sugarLevel'] as String?,
      cupSize: json['cupSize'] as String?,
      extras: (json['extras'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CustomizedDrinkToJson(CustomizedDrink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customName': instance.customName,
      'baseDrink': instance.baseDrink,
      'milkType': instance.milkType,
      'sugarLevel': instance.sugarLevel,
      'cupSize': instance.cupSize,
      'extras': instance.extras,
      'totalPrice': instance.totalPrice,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
