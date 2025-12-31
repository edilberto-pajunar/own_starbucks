import 'dart:typed_data';

import 'package:own_starbucks/features/home/model/drink.dart';

abstract class DrinkRepository {
  Future<List<Drink>> getDrinks();
  Future<void> addDrink(Drink drink, Uint8List imageBytes, String filename);
}
