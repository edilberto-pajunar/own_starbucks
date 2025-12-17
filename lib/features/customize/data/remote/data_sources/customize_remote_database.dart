import 'package:dio/dio.dart';
import 'package:own_starbucks/client/api_client.dart';
import 'package:own_starbucks/features/customize/model/customized_drink.dart';

abstract class CustomizeRemoteDatabase {
  Future<List<CustomizedDrink>> retrieve();
}

class CustomizeRemoteDatabaseImpl extends ApiClient
    implements CustomizeRemoteDatabase {
  CustomizeRemoteDatabaseImpl() : super(dio: Dio());

  @override
  Future<List<CustomizedDrink>> retrieve() async {
    try {
      final response = await get('/drinks/customized');
      return (response.data as List<dynamic>)
          .map(
            (drink) => CustomizedDrink.fromJson(drink as Map<String, dynamic>),
          )
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
