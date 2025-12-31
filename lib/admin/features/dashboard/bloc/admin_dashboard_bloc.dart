import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_dashboard_event.dart';
part 'admin_dashboard_state.dart';

class AdminDashboardBloc
    extends Bloc<AdminDashboardEvent, AdminDashboardState> {
  AdminDashboardBloc() : super(AdminDashboardState()) {
    on<AdminDashboardChildChanged>(_onChildChanged);
  }

  void _onChildChanged(
    AdminDashboardChildChanged event,
    Emitter<AdminDashboardState> emit,
  ) {
    emit(state.copyWith(child: event.child));
  }
}
