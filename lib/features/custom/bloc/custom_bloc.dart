import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:own_starbucks/features/custom/model/custom_drink.dart';
import 'package:own_starbucks/features/custom/repository/custom_repository.dart';

part 'custom_event.dart';
part 'custom_state.dart';

class CustomBloc extends Bloc<CustomEvent, CustomState> {
  final CustomRepository _customizeRepository;

  CustomBloc({required CustomRepository customizeRepository})
    : _customizeRepository = customizeRepository,
      super(CustomState()) {
    on<CustomInitRequested>(_onInitRequested);
    on<CustomAddRequested>(_onAddRequested);
  }

  void _onInitRequested(
    CustomInitRequested event,
    Emitter<CustomState> emit,
  ) async {
    emit(state.copyWith(customizeStatus: CustomStatus.loading));
    try {
      final drinks = await _customizeRepository.getCustomDrinks();
      emit(
        state.copyWith(
          customizeStatus: CustomStatus.success,
          customDrinks: drinks,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          customizeStatus: CustomStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _onAddRequested(
    CustomAddRequested event,
    Emitter<CustomState> emit,
  ) async {
    emit(state.copyWith(customizeStatus: CustomStatus.loading));
    try {
      await _customizeRepository.addCustomDrink(event.drink);
      emit(
        state.copyWith(
          customizeStatus: CustomStatus.success,
          customDrinks: [...state.customDrinks, event.drink],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          customizeStatus: CustomStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
