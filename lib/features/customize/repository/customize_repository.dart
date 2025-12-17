import 'package:own_starbucks/features/customize/model/customized_drink.dart';

abstract class CustomizeRepository {
  Future<List<CustomizedDrink>> getCustomizedDrinks();
  Future<void> addCustomizedDrink(CustomizedDrink drink);
}
