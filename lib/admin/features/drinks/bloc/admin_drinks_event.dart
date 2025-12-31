part of 'admin_drinks_bloc.dart';

class AdminDrinksEvent extends Equatable {
  const AdminDrinksEvent();

  @override
  List<Object> get props => [];
}

class AdminDrinksInitRequested extends AdminDrinksEvent {}

class AdminDrinkAddRequested extends AdminDrinksEvent {
  final String name;
  final String category;
  final String baseBeverage;
  final String defaultSize;
  final String description;
  final Uint8List imageBytes;
  final String filename;

  const AdminDrinkAddRequested({
    required this.name,
    required this.category,
    required this.baseBeverage,
    required this.defaultSize,
    required this.description,
    required this.imageBytes,
    required this.filename,
  });
}
