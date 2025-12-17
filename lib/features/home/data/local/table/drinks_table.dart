import 'package:drift/drift.dart';

class DrinksTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get description => text().withLength(min: 1, max: 255)();
  TextColumn get image => text().withLength(min: 1, max: 255)();
  RealColumn get price => real()();
  TextColumn get category => text().withLength(min: 1, max: 255)();
  IntColumn get calories => integer()();
}
