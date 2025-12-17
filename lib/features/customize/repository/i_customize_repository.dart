import 'package:own_starbucks/features/customize/data/local/data_sources/customize_local_database.dart';
import 'package:own_starbucks/features/customize/model/customized_drink.dart';
import 'package:own_starbucks/features/customize/repository/customize_repository.dart';

class ICustomizeRepository implements CustomizeRepository {
  final CustomizeLocalDatabase _localDatabase;

  ICustomizeRepository({required CustomizeLocalDatabase localDatabase})
    : _localDatabase = localDatabase;

  @override
  Future<List<CustomizedDrink>> getCustomizedDrinks() async {
    return await _localDatabase.retrieve();
  }

  @override
  Future<void> addCustomizedDrink(CustomizedDrink drink) async {
    await _localDatabase.insert(drink);
  }
}
