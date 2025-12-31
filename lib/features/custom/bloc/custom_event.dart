part of 'custom_bloc.dart';

class CustomEvent extends Equatable {
  const CustomEvent();

  @override
  List<Object> get props => [];
}

class CustomInitRequested extends CustomEvent {}

class CustomAddRequested extends CustomEvent {
  final CustomDrink drink;

  const CustomAddRequested({required this.drink});
}
