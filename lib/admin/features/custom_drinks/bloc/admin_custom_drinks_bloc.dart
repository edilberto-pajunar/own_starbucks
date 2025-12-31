import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:own_starbucks/features/custom/model/custom_drink.dart';
import 'package:own_starbucks/features/custom/repository/custom_repository.dart';

part 'admin_custom_drinks_event.dart';
part 'admin_custom_drinks_state.dart';

class AdminCustomDrinksBloc
    extends Bloc<AdminCustomDrinksEvent, AdminCustomDrinksState> {
  final CustomRepository _customRepository;

  AdminCustomDrinksBloc({required CustomRepository customRepository})
    : _customRepository = customRepository,
      super(AdminCustomDrinksState()) {
    on<AdminCustomDrinksInitRequested>(_onInitRequested);
  }

  void _onInitRequested(
    AdminCustomDrinksInitRequested event,
    Emitter<AdminCustomDrinksState> emit,
  ) async {
    emit(state.copyWith(status: AdminCustomDrinksStatus.loading));
    try {
      final customDrinks = await _customRepository.getCustomDrinks();
      emit(
        state.copyWith(
          status: AdminCustomDrinksStatus.success,
          customDrinks: customDrinks,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: AdminCustomDrinksStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
