import 'package:own_starbucks/features/home/data/local/data_source/drink_local_repository.dart';
import 'package:own_starbucks/features/home/data/remote/data_source/drink_remote_repository.dart';
import 'package:own_starbucks/features/home/model/drink.dart';
import 'package:own_starbucks/features/home/repository/drink_repository.dart';

class IDrinkRepository implements DrinkRepository {
  final DrinkRemoteRepository _remoteRepository;
  final DrinkLocalRepository _localRepository;

  IDrinkRepository({
    required DrinkRemoteRepository remoteRepository,
    required DrinkLocalRepository localRepository,
  }) : _remoteRepository = remoteRepository,
       _localRepository = localRepository;

  @override
  Future<List<Drink>> getDrinks() async {
    try {
      final drinks = await _remoteRepository.getDrinks();
      // for (var drink in drinks) {
      //   await _localRepository.insert(drink);
      // }
      return drinks;
    } catch (e) {
      final drinks = await _localRepository.getDrinks();
      return drinks;
    }
  }
}
