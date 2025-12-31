part of 'admin_dashboard_bloc.dart';

class AdminDashboardEvent extends Equatable {
  const AdminDashboardEvent();

  @override
  List<Object> get props => [];
}

class AdminDashboardChildChanged extends AdminDashboardEvent {
  final AdminDashboardChild child;
  const AdminDashboardChildChanged({required this.child});
}
