import 'package:own_starbucks/app/app_locator.dart';
import 'package:own_starbucks/features/home/model/drink.dart';

abstract class DrinkLocalRepository {
  Future<List<Drink>> getDrinks();
  Future<void> insert(Drink drink);
}

class DrinkLocalRepositoryImpl implements DrinkLocalRepository {
  @override
  Future<List<Drink>> getDrinks() async {
    final drinks = await appDatabase.select(appDatabase.drinksTable).get();
    // return drinks.map((drink) => Drink.fromDrift(drink)).toList();
    return [];
  }

  @override
  Future<void> insert(Drink drink) async {
    // await appDatabase
    //     .into(appDatabase.drinksTable)
    //     .insertOnConflictUpdate(drink.toCompanion());
  }
}
