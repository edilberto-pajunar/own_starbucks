part of 'admin_drinks_bloc.dart';

enum AdminDrinksStatus { initial, loading, success, error }

class AdminDrinksState extends Equatable {
  final AdminDrinksStatus status;
  final List<Drink> drinks;
  final String? errorMessage;

  const AdminDrinksState({
    this.status = AdminDrinksStatus.initial,
    this.drinks = const [],
    this.errorMessage,
  });

  AdminDrinksState copyWith({
    AdminDrinksStatus? status,
    List<Drink>? drinks,
    String? errorMessage,
  }) {
    return AdminDrinksState(
      status: status ?? this.status,
      drinks: drinks ?? this.drinks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, drinks, errorMessage];
}
