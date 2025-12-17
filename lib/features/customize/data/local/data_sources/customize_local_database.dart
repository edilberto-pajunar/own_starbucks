import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:own_starbucks/app/app_locator.dart';
import 'package:own_starbucks/app/app_table.dart';
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

    return drinks
        .map(
          (data) => CustomizedDrink(
            id: data.id.toString(),
            customName: data.customName,
            baseDrink: data.baseDrink,
            milkType: data.milkType,
            sugarLevel: data.sugarLevel,
            cupSize: data.cupSize,
            extras: List<String>.from(jsonDecode(data.extras)),
            totalPrice: data.totalPrice,
            createdAt: data.createdAt,
          ),
        )
        .toList();
  }

  @override
  Future<int> insert(CustomizedDrink drink) async {
    return await appDatabase
        .into(appDatabase.customizedDrinksTable)
        .insert(
          CustomizedDrinksTableCompanion.insert(
            customName: drink.customName ?? '',
            baseDrink: drink.baseDrink ?? '',
            milkType: drink.milkType ?? '',
            sugarLevel: drink.sugarLevel ?? '',
            cupSize: drink.cupSize ?? '',
            extras: jsonEncode(drink.extras),
            totalPrice: drink.totalPrice ?? 0.0,
            createdAt: drink.createdAt ?? DateTime.now(),
          ),
        );
  }

  @override
  Future<bool> update(CustomizedDrink drink) async {
    final result =
        await (appDatabase.update(
          appDatabase.customizedDrinksTable,
        )..where((tbl) => tbl.id.equals(int.parse(drink.id ?? '')))).write(
          CustomizedDrinksTableCompanion(
            customName: Value(drink.customName ?? ''),
            baseDrink: Value(drink.baseDrink ?? ''),
            milkType: Value(drink.milkType ?? ''),
            sugarLevel: Value(drink.sugarLevel ?? ''),
            cupSize: Value(drink.cupSize ?? ''),
            extras: Value(jsonEncode(drink.extras)),
            totalPrice: Value(drink.totalPrice ?? 0.0),
            createdAt: Value(drink.createdAt ?? DateTime.now()),
          ),
        );
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
