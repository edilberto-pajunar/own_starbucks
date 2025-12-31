import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:own_starbucks/client/api_client.dart';
import 'package:own_starbucks/features/custom/model/custom_drink.dart';

abstract class CustomRemoteDatabase {
  Future<List<CustomDrink>> retrieve();
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

  @override
  Future<void> addCustomDrink({
    required String name,
    required int baseDrinkId,
    required String milkType,
    required String sugarLevel,
    required String cupSize,
    required double totalPrice,
    required Uint8List imageBytes,
    required String filename,
  }) async {
    final formData = FormData.fromMap({
      'name': name,
      'base_drink_id': baseDrinkId,
      'milk_type': milkType,
      'sugar_level': sugarLevel,
      'cup_size': cupSize,
      'total_price': totalPrice,
      'image': MultipartFile.fromBytes(imageBytes, filename: filename),
    });
    final response = await post(
      '/custom-drinks',
      data: formData,
      isJson: false,
      options: Options(headers: {'Content-Type': 'multipart/form-data'}),
    );
    return response.data;
  }
}
