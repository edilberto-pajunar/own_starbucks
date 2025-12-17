import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:own_starbucks/features/customize/model/customized_drink.dart';
import 'package:own_starbucks/features/customize/repository/customize_repository.dart';

part 'customize_event.dart';
part 'customize_state.dart';

class CustomizeBloc extends Bloc<CustomizeEvent, CustomizeState> {
  final CustomizeRepository _customizeRepository;

  CustomizeBloc({required CustomizeRepository customizeRepository})
    : _customizeRepository = customizeRepository,
      super(CustomizeState()) {
    on<CustomizeInitRequested>(_onInitRequested);
    on<CustomizeAddRequested>(_onAddRequested);
  }

  void _onInitRequested(
    CustomizeInitRequested event,
    Emitter<CustomizeState> emit,
  ) async {
    emit(state.copyWith(customizeStatus: CustomizeStatus.loading));
    try {
      final drinks = await _customizeRepository.getCustomizedDrinks();
      emit(
        state.copyWith(
          customizeStatus: CustomizeStatus.success,
          customizedDrinks: drinks,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          customizeStatus: CustomizeStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _onAddRequested(
    CustomizeAddRequested event,
    Emitter<CustomizeState> emit,
  ) async {
    emit(state.copyWith(customizeStatus: CustomizeStatus.loading));
    try {
      await _customizeRepository.addCustomizedDrink(event.drink);
      emit(
        state.copyWith(
          customizeStatus: CustomizeStatus.success,
          customizedDrinks: [...state.customizedDrinks, event.drink],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          customizeStatus: CustomizeStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
