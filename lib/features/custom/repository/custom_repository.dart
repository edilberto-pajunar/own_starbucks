import 'package:own_starbucks/features/custom/model/custom_drink.dart';

abstract class CustomRepository {
  Future<List<CustomDrink>> getCustomDrinks();
  Future<void> addCustomDrink(CustomDrink drink);
}
