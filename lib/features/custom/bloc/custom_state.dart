part of 'custom_bloc.dart';

enum CustomStatus { initial, loading, success, error }

class CustomState extends Equatable {
  final CustomStatus customizeStatus;
  final List<CustomDrink> customDrinks;
  final String? errorMessage;

  const CustomState({
    this.customizeStatus = CustomStatus.initial,
    this.customDrinks = const [],
    this.errorMessage,
  });

  CustomState copyWith({
    CustomStatus? customizeStatus,
    List<CustomDrink>? customDrinks,
    String? errorMessage,
  }) {
    return CustomState(
      customizeStatus: customizeStatus ?? this.customizeStatus,
      customDrinks: customDrinks ?? this.customDrinks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [customizeStatus, customDrinks, errorMessage];
}
