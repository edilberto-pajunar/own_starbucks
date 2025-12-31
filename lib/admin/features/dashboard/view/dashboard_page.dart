import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/admin/features/custom_drinks/bloc/admin_custom_drinks_bloc.dart';
import 'package:own_starbucks/admin/features/dashboard/bloc/admin_dashboard_bloc.dart';
import 'package:own_starbucks/admin/features/dashboard/view/dashboard_view.dart';
import 'package:own_starbucks/admin/features/drinks/bloc/admin_drinks_bloc.dart';
import 'package:own_starbucks/app/app_locator.dart';

class AdminDashboardPage extends StatelessWidget {
  static const String route = 'admin_dashboard_route';

  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AdminDashboardBloc>()),
        BlocProvider.value(value: getIt<AdminDrinksBloc>()),
        BlocProvider.value(value: getIt<AdminCustomDrinksBloc>()),
      ],
      child: AdminDashboardView(),
    );
  }
}
