import 'package:drift/drift.dart';
import 'package:drift/web.dart';
import 'package:own_starbucks/features/custom/data/local/tables/custom_drinks_table.dart';
import 'package:own_starbucks/features/home/data/local/table/drinks_table.dart';

part 'app_table_web.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return WebDatabase('app_db');
  });
}

@DriftDatabase(tables: [CustomDrinksTable, DrinksTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < schemaVersion) {
          await m.deleteTable('drinks_table');
          await m.createTable(drinksTable);
        }
      },
    );
  }
}
