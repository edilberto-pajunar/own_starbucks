part of 'admin_custom_drinks_bloc.dart';

class AdminCustomDrinksEvent extends Equatable {
  const AdminCustomDrinksEvent();

  @override
  List<Object> get props => [];
}

class AdminCustomDrinksInitRequested extends AdminCustomDrinksEvent {}

class AdminCustomDrinkAddRequested extends AdminCustomDrinksEvent {
  final String name;
  final int baseDrinkId;
  final String milkType;
  final String sugarLevel;
  final String cupSize;
  final double totalPrice;
  final Uint8List imageBytes;
  final String filename;

  const AdminCustomDrinkAddRequested({
    required this.name,
    required this.baseDrinkId,
    required this.milkType,
    required this.sugarLevel,
    required this.cupSize,
    required this.totalPrice,
    required this.imageBytes,
    required this.filename,
  });
}
