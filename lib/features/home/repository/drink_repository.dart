import 'package:own_starbucks/features/home/model/drink.dart';

abstract class DrinkRepository {
  Future<List<Drink>> getDrinks();
}