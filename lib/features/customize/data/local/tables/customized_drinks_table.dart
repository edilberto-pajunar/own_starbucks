import 'package:drift/drift.dart';

class CustomizedDrinksTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get baseDrinkName => text().named("base_drink_name")();
  TextColumn get baseDrinkPhoto => text().named("base_drink_photo")();
  TextColumn get milkType =>
      text().named("milk_type").withLength(min: 1, max: 255)();
  TextColumn get sugarLevel =>
      text().named("sugar_level").withLength(min: 1, max: 255)();
  TextColumn get cupSize =>
      text().named("cup_size").withLength(min: 1, max: 255)();
  TextColumn get extras => text()();
  Column get totalPrice => real().named("total_price")();
  DateTimeColumn get createdAt => dateTime().named("created_at")();
}
