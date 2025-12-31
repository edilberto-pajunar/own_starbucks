import 'dart:convert';

import 'package:drift/drift.dart' hide JsonKey;
import 'package:json_annotation/json_annotation.dart';
import 'package:own_starbucks/app/app_table.dart';

part 'custom_drink.g.dart';

@JsonSerializable(explicitToJson: true)
class CustomDrink {
  @JsonKey(name: 'id')
  final int? id;
  final String? name;
  @JsonKey(name: 'base_drink_name')
  final String? baseDrinkName;
  @JsonKey(name: 'base_drink_photo')
  final String? baseDrinkPhoto;
  @JsonKey(name: 'milk_type')
  final String? milkType;
  @JsonKey(name: 'sugar_level')
  final String? sugarLevel;
  @JsonKey(name: 'cup_size')
  final String? cupSize;
  @JsonKey(name: 'extras')
  final List<String>? extras;
  @JsonKey(name: 'total_price')
  final num? totalPrice;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  CustomDrink({
    this.id,
    this.name,
    this.baseDrinkName,
    this.baseDrinkPhoto,
    this.milkType,
    this.sugarLevel,
    this.cupSize,
    this.extras,
    this.totalPrice,
    this.createdAt,
  });

  factory CustomDrink.fromJson(Map<String, dynamic> json) =>
      _$CustomDrinkFromJson(json);
  Map<String, dynamic> toJson() => _$CustomDrinkToJson(this);

  // To Drift Companion (for inserting into database)
  CustomDrinksTableCompanion toCompanion() {
    return CustomDrinksTableCompanion(
      id: Value(id ?? 0),
      name: Value(name ?? ''),
      baseDrinkName: Value(baseDrinkName ?? ''),
      baseDrinkPhoto: Value(baseDrinkPhoto ?? ''),
      milkType: Value(milkType ?? ''),
      sugarLevel: Value(sugarLevel ?? ''),
      cupSize: Value(cupSize ?? ''),
      extras: Value(extras?.join(',') ?? ''), // Convert list to JSON string
      totalPrice: Value((totalPrice ?? 0).toDouble()),
      createdAt: Value(createdAt ?? DateTime.now()),
    );
  }

  // From Drift database row
  factory CustomDrink.fromDrift(CustomDrinksTableData data) {
    return CustomDrink(
      id: data.id,
      name: data.name,
      baseDrinkName: data.baseDrinkName,
      baseDrinkPhoto: data.baseDrinkPhoto,
      milkType: data.milkType,
      sugarLevel: data.sugarLevel,
      cupSize: data.cupSize,
      extras: data.extras.split(','),
      totalPrice: data.totalPrice,
      createdAt: data.createdAt,
    );
  }
}

enum MilkType {
  whole('Whole Milk'),
  nonFat('Non-Fat Milk'),
  oat('Oat Milk'),
  almond('Almond Milk'),
  soy('Soy Milk'),
  coconut('Coconut Milk');

  final String label;
  const MilkType(this.label);
}

enum SugarLevel {
  none('No Sugar'),
  low('25% Sugar'),
  medium('50% Sugar'),
  standard('75% Sugar'),
  full('100% Sugar');

  final String label;
  const SugarLevel(this.label);
}

enum CupSize {
  tall('Tall (12 oz)', 0.0),
  grande('Grande (16 oz)', 0.5),
  venti('Venti (20 oz)', 1.0);

  final String label;
  final double priceModifier;
  const CupSize(this.label, this.priceModifier);
}
