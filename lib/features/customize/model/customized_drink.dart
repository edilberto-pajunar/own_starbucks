import 'package:json_annotation/json_annotation.dart';

part 'customized_drink.g.dart';

@JsonSerializable()
class CustomizedDrink {
  final String? id;
  final String? customName;
  final String? baseDrink;
  final String? milkType;
  final String? sugarLevel;
  final String? cupSize;
  final List<String>? extras;
  final double? totalPrice;
  final DateTime? createdAt;

  CustomizedDrink({
    this.id,
    this.customName,
    this.baseDrink,
    this.milkType,
    this.sugarLevel,
    this.cupSize,
    this.extras,
    this.totalPrice,
    this.createdAt,
  });

  factory CustomizedDrink.fromJson(Map<String, dynamic> json) =>
      _$CustomizedDrinkFromJson(json);
  Map<String, dynamic> toJson() => _$CustomizedDrinkToJson(this);
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
