part of 'customize_bloc.dart';

class CustomizeEvent extends Equatable {
  const CustomizeEvent();

  @override
  List<Object> get props => [];
}

class CustomizeInitRequested extends CustomizeEvent {}

class CustomizeAddRequested extends CustomizeEvent {
  final CustomizedDrink drink;

  const CustomizeAddRequested({required this.drink});
}
