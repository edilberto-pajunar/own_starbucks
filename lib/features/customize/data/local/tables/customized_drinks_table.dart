import 'package:drift/drift.dart';

class CustomizedDrinksTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get customName => text().withLength(min: 1, max: 255)();
  TextColumn get baseDrink => text().withLength(min: 1, max: 255)();
  TextColumn get milkType => text().withLength(min: 1, max: 255)();
  TextColumn get sugarLevel => text().withLength(min: 1, max: 255)();
  TextColumn get cupSize => text().withLength(min: 1, max: 255)();
  TextColumn get extras => text().withLength(min: 1, max: 255)();
  RealColumn get totalPrice => real()();
  DateTimeColumn get createdAt => dateTime()();
}
