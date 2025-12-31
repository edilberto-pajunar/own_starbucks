import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/admin/features/drinks/bloc/admin_drinks_bloc.dart';
import 'package:own_starbucks/admin/features/drinks/view/add_drink_view.dart';
import 'package:own_starbucks/app/app_locator.dart';

class AdminAddDrinkPage extends StatelessWidget {
  static const String route = 'admin_add_drink_route';
  const AdminAddDrinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<AdminDrinksBloc>(),
      child: const AdminAddDrinkView(),
    );
  }
}
