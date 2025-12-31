import 'package:own_starbucks/app/app_locator.dart';
import 'package:own_starbucks/features/custom/model/custom_drink.dart';

abstract class CustomLocalDatabase {
  Future<List<CustomDrink>> retrieve();
  Future<void> insert(CustomDrink drink);
  Future<bool> update(CustomDrink drink);
  Future<bool> delete(String id);
}

class CustomLocalDatabaseImpl implements CustomLocalDatabase {
  @override
  Future<List<CustomDrink>> retrieve() async {
    final drinks = await appDatabase
        .select(appDatabase.customDrinksTable)
        .get();

    return drinks.map((data) => CustomDrink.fromDrift(data)).toList();
  }

  @override
  Future<void> insert(CustomDrink drink) async {
    try {
      await appDatabase
          .into(appDatabase.customDrinksTable)
          .insertOnConflictUpdate(drink.toCompanion());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> update(CustomDrink drink) async {
    final result = await (appDatabase.update(
      appDatabase.customDrinksTable,
    )..where((tbl) => tbl.id.equals(drink.id ?? 0))).write(drink.toCompanion());
    return result > 0;
  }

  @override
  Future<bool> delete(String id) async {
    final result = await (appDatabase.delete(
      appDatabase.customDrinksTable,
    )..where((tbl) => tbl.id.equals(int.parse(id)))).go();
    return result > 0;
  }
}
