import 'package:dio/dio.dart';
import 'package:own_starbucks/client/api_client.dart';
import 'package:own_starbucks/features/home/model/drink.dart';

abstract class DrinkRemoteRepository {
  Future<List<Drink>> getDrinks();
}

class DrinkRemoteRepositoryImpl extends ApiClient
    implements DrinkRemoteRepository {
  DrinkRemoteRepositoryImpl() : super(dio: Dio());
  @override
  Future<List<Drink>> getDrinks() async {
    final response = await get("/drinks");
    return (response.data as List<dynamic>)
        .map((drink) => Drink.fromJson(drink))
        .toList();
  }
}
