import 'package:get_it/get_it.dart';
import 'package:own_starbucks/app/app_table.dart';
import 'package:own_starbucks/features/customize/bloc/customize_bloc.dart';
import 'package:own_starbucks/features/customize/data/local/data_sources/customize_local_database.dart';
import 'package:own_starbucks/features/customize/data/remote/data_sources/customize_remote_database.dart';
import 'package:own_starbucks/features/customize/repository/customize_repository.dart';
import 'package:own_starbucks/features/customize/repository/i_customize_repository.dart';
import 'package:own_starbucks/features/home/bloc/home_bloc.dart';
import 'package:own_starbucks/features/home/data/local/data_source/drink_local_repository.dart';
import 'package:own_starbucks/features/home/data/remote/data_source/drink_remote_repository.dart';
import 'package:own_starbucks/features/home/repository/drink_repository.dart';
import 'package:own_starbucks/features/home/repository/i_drink_repository.dart';

final GetIt getIt = GetIt.instance;
final appDatabase = AppDatabase();

void setupLocator() {
  getIt.registerLazySingleton<CustomizeLocalDatabase>(
    () => CustomizeLocalDatabaseImpl(),
  );
  getIt.registerLazySingleton<CustomizeRemoteDatabase>(
    () => CustomizeRemoteDatabaseImpl(),
  );

  getIt.registerLazySingleton<DrinkLocalRepository>(
    () => DrinkLocalRepositoryImpl(),
  );
  getIt.registerLazySingleton<DrinkRemoteRepository>(
    () => DrinkRemoteRepositoryImpl(),
  );
  getIt.registerLazySingleton<DrinkRepository>(
    () => IDrinkRepository(localRepository: getIt(), remoteRepository: getIt()),
  );

  getIt.registerLazySingleton<CustomizeRepository>(
    () => ICustomizeRepository(localDatabase: getIt(), remoteDatabase: getIt()),
  );

  // BLOCS
  getIt.registerLazySingleton<CustomizeBloc>(
    () => CustomizeBloc(customizeRepository: getIt()),
  );
  getIt.registerLazySingleton<HomeBloc>(
    () => HomeBloc(drinkRepository: getIt()),
  );
}
