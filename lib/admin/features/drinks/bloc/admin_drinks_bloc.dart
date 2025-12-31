import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:own_starbucks/features/home/model/drink.dart';
import 'package:own_starbucks/features/home/repository/drink_repository.dart';

part 'admin_drinks_event.dart';
part 'admin_drinks_state.dart';

class AdminDrinksBloc extends Bloc<AdminDrinksEvent, AdminDrinksState> {
  final DrinkRepository _drinkRepository;

  AdminDrinksBloc({required DrinkRepository drinkRepository})
    : _drinkRepository = drinkRepository,
      super(AdminDrinksState()) {
    on<AdminDrinksInitRequested>(_onInitRequested);
    on<AdminDrinkAddRequested>(_onAddRequested);
  }

  void _onInitRequested(
    AdminDrinksInitRequested event,
    Emitter<AdminDrinksState> emit,
  ) async {
    emit(state.copyWith(status: AdminDrinksStatus.loading));
    try {
      final drinks = await _drinkRepository.getDrinks();
      emit(state.copyWith(status: AdminDrinksStatus.success, drinks: drinks));
    } catch (e) {
      emit(
        state.copyWith(
          status: AdminDrinksStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _onAddRequested(
    AdminDrinkAddRequested event,
    Emitter<AdminDrinksState> emit,
  ) async {
    emit(state.copyWith(status: AdminDrinksStatus.loading));
    try {
      await _drinkRepository.addDrink(
        Drink(
          name: event.name,
          category: event.category,
          baseBeverage: event.baseBeverage,
          defaultSize: event.defaultSize,
          description: event.description,
        ),
        event.imageBytes,
        event.filename,
      );
      add(AdminDrinksInitRequested());
    } catch (e) {
      emit(
        state.copyWith(
          status: AdminDrinksStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
