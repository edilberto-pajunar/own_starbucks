import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/admin/features/drinks/bloc/admin_drinks_bloc.dart';
import 'package:own_starbucks/admin/features/drinks/view/drink_details_view.dart';
import 'package:own_starbucks/app/app_locator.dart';

class AdminDrinkDetailsPage extends StatelessWidget {
  static const String route = 'admin_drink_details_route';
  final String drinkId;
  const AdminDrinkDetailsPage({super.key, required this.drinkId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AdminDrinksBloc>(),
      child: AdminDrinkDetailsView(drinkId: drinkId),
    );
  }
}
