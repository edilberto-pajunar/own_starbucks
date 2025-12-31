import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:own_starbucks/client/api_client.dart';
import 'package:own_starbucks/features/home/model/drink.dart';

abstract class DrinkRemoteRepository {
  Future<List<Drink>> getDrinks();
  Future<void> addDrink(Drink drink, Uint8List imageBytes, String filename);
}

class DrinkRemoteRepositoryImpl extends ApiClient
    implements DrinkRemoteRepository {
  DrinkRemoteRepositoryImpl() : super(dio: Dio());
  @override
  Future<List<Drink>> getDrinks() async {
    final response = await get("/drinks/with-ingredients");
    return (response.data as List<dynamic>)
        .map((drink) => Drink.fromJson(drink))
        .toList();
  }

  @override
  Future<void> addDrink(
    Drink drink,
    Uint8List imageBytes,
    String filename,
  ) async {
    final formData = FormData.fromMap({
      'name': drink.name ?? "",
      'category': drink.category ?? "",
      'description': drink.description ?? "",
      'base_beverage': drink.baseBeverage ?? "",
      'default_size': drink.defaultSize ?? "",
      'is_customizable': drink.isCustomizable ?? true,
      'image': MultipartFile.fromBytes(imageBytes, filename: filename),
    });
    final response = await post(
      "/drinks",
      data: formData,
      isJson: false,
      options: Options(headers: {"Content-Type": "multipart/form-data"}),
    );
    return response.data;
  }
}
