part of 'admin_custom_drinks_bloc.dart';

enum AdminCustomDrinksStatus { initial, loading, success, error }

class AdminCustomDrinksState extends Equatable {
  final AdminCustomDrinksStatus status;
  final List<CustomDrink> customDrinks;
  final String? errorMessage;

  const AdminCustomDrinksState({
    this.status = AdminCustomDrinksStatus.initial,
    this.customDrinks = const [],
    this.errorMessage,
  });

  AdminCustomDrinksState copyWith({
    AdminCustomDrinksStatus? status,
    List<CustomDrink>? customDrinks,
    String? errorMessage,
  }) {
    return AdminCustomDrinksState(
      status: status ?? this.status,
      customDrinks: customDrinks ?? this.customDrinks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, customDrinks, errorMessage];
}
