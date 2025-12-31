part of 'admin_dashboard_bloc.dart';

enum AdminDashboardChild { drinks, customDrinks }

class AdminDashboardState extends Equatable {
  final AdminDashboardChild child;
  const AdminDashboardState({this.child = AdminDashboardChild.drinks});

  AdminDashboardState copyWith({AdminDashboardChild? child}) {
    return AdminDashboardState(child: child ?? this.child);
  }

  @override
  List<Object> get props => [child];
}
