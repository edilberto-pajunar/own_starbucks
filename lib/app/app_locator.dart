import 'package:get_it/get_it.dart';
import 'package:own_starbucks/app/app_table.dart';
import 'package:own_starbucks/features/customize/bloc/customize_bloc.dart';
import 'package:own_starbucks/features/customize/data/local/data_sources/customize_local_database.dart';
import 'package:own_starbucks/features/customize/repository/customize_repository.dart';
import 'package:own_starbucks/features/customize/repository/i_customize_repository.dart';

final GetIt getIt = GetIt.instance;
final appDatabase = AppDatabase();

void setupLocator() {
  getIt.registerLazySingleton<CustomizeLocalDatabase>(
    () => CustomizeLocalDatabaseImpl(),
  );

  getIt.registerLazySingleton<CustomizeRepository>(
    () => ICustomizeRepository(localDatabase: getIt()),
  );
  getIt.registerLazySingleton<CustomizeBloc>(
    () => CustomizeBloc(customizeRepository: getIt()),
  );
}
