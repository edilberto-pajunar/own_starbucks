import 'package:dio/dio.dart';
import 'package:own_starbucks/client/api_client.dart';
import 'package:own_starbucks/features/custom/model/custom_drink.dart';

abstract class CustomRemoteDatabase {
  Future<List<CustomDrink>> retrieve();
}

class CustomRemoteDatabaseImpl extends ApiClient
    implements CustomRemoteDatabase {
  CustomRemoteDatabaseImpl() : super(dio: Dio());

  @override
  Future<List<CustomDrink>> retrieve() async {
    try {
      final response = await get('/custom-drinks/with-ingredients');
      return (response.data as List<dynamic>)
          .map((drink) => CustomDrink.fromJson(drink as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
