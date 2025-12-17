import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:own_starbucks/features/customize/data/local/tables/customized_drinks_table.dart';
import 'package:own_starbucks/features/home/data/local/table/drinks_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'app_table.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'app.db'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [CustomizedDrinksTable, DrinksTable])
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
          // Add migration logic here if needed
          // For now, recreate the table
          await m.deleteTable('drinks_table');
          await m.createTable(drinksTable);
        }
      },
    );
  }
}
