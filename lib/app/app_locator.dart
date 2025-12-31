import 'package:get_it/get_it.dart';
import 'package:own_starbucks/admin/features/custom_drinks/bloc/admin_custom_drinks_bloc.dart';
import 'package:own_starbucks/admin/features/dashboard/bloc/admin_dashboard_bloc.dart';
import 'package:own_starbucks/admin/features/drinks/bloc/admin_drinks_bloc.dart';
import 'package:own_starbucks/app/app_table.dart';
import 'package:own_starbucks/features/custom/bloc/custom_bloc.dart';
import 'package:own_starbucks/features/custom/data/local/data_sources/custom_local_database.dart';
import 'package:own_starbucks/features/custom/data/remote/data_sources/custom_remote_database.dart';
import 'package:own_starbucks/features/custom/repository/custom_repository.dart';
import 'package:own_starbucks/features/custom/repository/i_custom_repository.dart';
import 'package:own_starbucks/features/home/bloc/home_bloc.dart';
import 'package:own_starbucks/features/home/data/local/data_source/drink_local_repository.dart';
import 'package:own_starbucks/features/home/data/remote/data_source/drink_remote_repository.dart';
import 'package:own_starbucks/features/home/repository/drink_repository.dart';
import 'package:own_starbucks/features/home/repository/i_drink_repository.dart';

final GetIt getIt = GetIt.instance;
final appDatabase = AppDatabase();

void setupLocator() {
  getIt.registerLazySingleton<CustomLocalDatabase>(
    () => CustomLocalDatabaseImpl(),
  );
  getIt.registerLazySingleton<CustomRemoteDatabase>(
    () => CustomRemoteDatabaseImpl(),
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

  getIt.registerLazySingleton<CustomRepository>(
    () => ICustomRepository(localDatabase: getIt(), remoteDatabase: getIt()),
  );

  // ADMIN BLOCS
  getIt.registerLazySingleton<AdminDrinksBloc>(
    () => AdminDrinksBloc(drinkRepository: getIt()),
  );
  getIt.registerLazySingleton<AdminCustomDrinksBloc>(
    () => AdminCustomDrinksBloc(customRepository: getIt()),
  );
  getIt.registerLazySingleton<AdminDashboardBloc>(() => AdminDashboardBloc());

  // BLOCS
  getIt.registerLazySingleton<CustomBloc>(
    () => CustomBloc(customizeRepository: getIt()),
  );
  getIt.registerLazySingleton<HomeBloc>(
    () => HomeBloc(drinkRepository: getIt()),
  );
}
