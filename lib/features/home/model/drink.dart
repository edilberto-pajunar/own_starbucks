import 'package:drift/drift.dart' hide JsonKey;
import 'package:json_annotation/json_annotation.dart';
import 'package:own_starbucks/app/app_table.dart';

part 'drink.g.dart';

@JsonSerializable()
class Drink {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "price")
  final num? price;
  @JsonKey(name: "category")
  final String? category;
  @JsonKey(name: "calories")
  final int? calories;

  Drink({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.category,
    this.calories,
  });

  factory Drink.fromJson(Map<String, dynamic> json) => _$DrinkFromJson(json);
  Map<String, dynamic> toJson() => _$DrinkToJson(this);

  DrinksTableCompanion toCompanion() {
    return DrinksTableCompanion(
      id: Value(id ?? 0),
      name: Value(name ?? ''),
      description: Value(description ?? ''),
      image: Value(image ?? ''),
      price: Value(price?.toDouble() ?? 0),
      category: Value(category ?? ''),
      calories: Value(calories ?? 0),
    );
  }

  factory Drink.fromDrift(DrinksTableData data) {
    return Drink(
      id: data.id,
      name: data.name,
      description: data.description,
      image: data.image,
      price: data.price,
      category: data.category,
      calories: data.calories,
    );
  }
}
