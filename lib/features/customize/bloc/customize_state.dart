part of 'customize_bloc.dart';

enum CustomizeStatus { initial, loading, success, error }

class CustomizeState extends Equatable {
  final CustomizeStatus customizeStatus;
  final List<CustomizedDrink> customizedDrinks;
  final String? errorMessage;

  const CustomizeState({
    this.customizeStatus = CustomizeStatus.initial,
    this.customizedDrinks = const [],
    this.errorMessage,
  });

  CustomizeState copyWith({
    CustomizeStatus? customizeStatus,
    List<CustomizedDrink>? customizedDrinks,
    String? errorMessage,
  }) {
    return CustomizeState(
      customizeStatus: customizeStatus ?? this.customizeStatus,
      customizedDrinks: customizedDrinks ?? this.customizedDrinks,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [customizeStatus, customizedDrinks, errorMessage];
}
