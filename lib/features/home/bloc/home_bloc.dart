import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:own_starbucks/features/home/model/drink.dart';
import 'package:own_starbucks/features/home/repository/drink_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DrinkRepository _drinkRepository;

  HomeBloc({required DrinkRepository drinkRepository})
    : _drinkRepository = drinkRepository,
      super(HomeState()) {
    on<HomeDrinksInitRequested>(_onDrinksInitRequested);
  }

  void _onDrinksInitRequested(
    HomeDrinksInitRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(drinksStatus: HomeDrinksStatus.loading));
    try {
      final drinks = await _drinkRepository.getDrinks();
      print(drinks);
      emit(
        state.copyWith(drinksStatus: HomeDrinksStatus.success, drinks: drinks),
      );
    } catch (e) {
      emit(
        state.copyWith(
          drinksStatus: HomeDrinksStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
