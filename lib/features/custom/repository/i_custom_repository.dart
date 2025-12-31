import 'package:dio/dio.dart';
import 'package:own_starbucks/client/api_client.dart';
import 'package:own_starbucks/features/custom/data/local/data_sources/custom_local_database.dart';
import 'package:own_starbucks/features/custom/data/remote/data_sources/custom_remote_database.dart';
import 'package:own_starbucks/features/custom/model/custom_drink.dart';
import 'package:own_starbucks/features/custom/repository/custom_repository.dart';

class ICustomRepository extends ApiClient implements CustomRepository {
  final CustomLocalDatabase _localDatabase;
  final CustomRemoteDatabase _remoteDatabase;

  ICustomRepository({
    required CustomLocalDatabase localDatabase,
    required CustomRemoteDatabase remoteDatabase,
  }) : _localDatabase = localDatabase,
       _remoteDatabase = remoteDatabase,
       super(dio: Dio());

  @override
  Future<List<CustomDrink>> getCustomDrinks() async {
    try {
    final drinks = await _remoteDatabase.retrieve();
      // for (var drink in drinks) {
      //   await _localDatabase.insert(drink);
      // }
      return drinks;
    } catch (e) {
      final drinks = await _localDatabase.retrieve();
      return drinks;
    }
  }

  @override
  Future<void> addCustomDrink(CustomDrink drink) async {
    await _localDatabase.insert(drink);
  }
}
