import 'dart:typed_data';

import 'package:own_starbucks/features/custom/model/custom_drink.dart';

abstract class CustomRepository {
  Future<List<CustomDrink>> getCustomDrinks();
  Future<void> addCustomDrink({
    required String name,
    required int baseDrinkId,
    required String milkType,
    required String sugarLevel,
    required String cupSize,
    required double totalPrice,
    required Uint8List imageBytes,
    required String filename,
  });
}
