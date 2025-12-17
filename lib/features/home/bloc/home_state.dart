part of 'home_bloc.dart';

enum HomeDrinksStatus { initial, loading, success, error }

class HomeState extends Equatable {
  final HomeDrinksStatus drinksStatus;
  final List<Drink> drinks;
  final String? errorMessage;

  const HomeState({
    this.drinksStatus = HomeDrinksStatus.initial,
    this.drinks = const [],
    this.errorMessage,
  });

  HomeState copyWith({
    HomeDrinksStatus? drinksStatus,
    List<Drink>? drinks,
    String? errorMessage,
  }) {
    return HomeState(
      drinksStatus: drinksStatus ?? this.drinksStatus,
      drinks: drinks ?? this.drinks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [drinksStatus, drinks, errorMessage];
}
