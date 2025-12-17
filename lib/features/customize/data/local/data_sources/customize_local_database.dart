import 'package:own_starbucks/app/app_locator.dart';
import 'package:own_starbucks/features/customize/model/customized_drink.dart';

abstract class CustomizeLocalDatabase {
  Future<List<CustomizedDrink>> retrieve();
  Future<void> insert(CustomizedDrink drink);
  Future<bool> update(CustomizedDrink drink);
  Future<bool> delete(String id);
}

class CustomizeLocalDatabaseImpl implements CustomizeLocalDatabase {
  @override
  Future<List<CustomizedDrink>> retrieve() async {
    final drinks = await appDatabase
        .select(appDatabase.customizedDrinksTable)
        .get();

    return drinks.map((data) => CustomizedDrink.fromDrift(data)).toList();
  }

  @override
  Future<void> insert(CustomizedDrink drink) async {
    try {
      await appDatabase
          .into(appDatabase.customizedDrinksTable)
          .insertOnConflictUpdate(drink.toCompanion());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> update(CustomizedDrink drink) async {
    final result = await (appDatabase.update(
      appDatabase.customizedDrinksTable,
    )..where((tbl) => tbl.id.equals(drink.id ?? 0))).write(drink.toCompanion());
    return result > 0;
  }

  @override
  Future<bool> delete(String id) async {
    final result = await (appDatabase.delete(
      appDatabase.customizedDrinksTable,
    )..where((tbl) => tbl.id.equals(int.parse(id)))).go();
    return result > 0;
  }
}
