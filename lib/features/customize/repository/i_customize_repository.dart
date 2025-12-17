import 'package:dio/dio.dart';
import 'package:own_starbucks/client/api_client.dart';
import 'package:own_starbucks/features/customize/data/local/data_sources/customize_local_database.dart';
import 'package:own_starbucks/features/customize/data/remote/data_sources/customize_remote_database.dart';
import 'package:own_starbucks/features/customize/model/customized_drink.dart';
import 'package:own_starbucks/features/customize/repository/customize_repository.dart';

class ICustomizeRepository extends ApiClient implements CustomizeRepository {
  final CustomizeLocalDatabase _localDatabase;
  final CustomizeRemoteDatabase _remoteDatabase;

  ICustomizeRepository({
    required CustomizeLocalDatabase localDatabase,
    required CustomizeRemoteDatabase remoteDatabase,
  }) : _localDatabase = localDatabase,
       _remoteDatabase = remoteDatabase,
       super(dio: Dio());

  @override
  Future<List<CustomizedDrink>> getCustomizedDrinks() async {
    try {
      final drinks = await _remoteDatabase.retrieve();
      for (var drink in drinks) {
        await _localDatabase.insert(drink);
      }
      return drinks;
    } catch (e) {
      final drinks = await _localDatabase.retrieve();
      return drinks;
    }
  }

  @override
  Future<void> addCustomizedDrink(CustomizedDrink drink) async {
    await _localDatabase.insert(drink);
  }
}
