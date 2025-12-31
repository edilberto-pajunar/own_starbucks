import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/admin/features/custom_drinks/view/custom_drinks_view.dart';
import 'package:own_starbucks/admin/features/dashboard/bloc/admin_dashboard_bloc.dart';
import 'package:own_starbucks/admin/features/drinks/view/drinks_view.dart';
import 'package:own_starbucks/admin/features/widgets/menu_sidebar.dart';

class AdminDashboardView extends StatefulWidget {
  const AdminDashboardView({super.key});

  @override
  State<AdminDashboardView> createState() => _AdminDashboardViewState();
}

class _AdminDashboardViewState extends State<AdminDashboardView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: BlocBuilder<AdminDashboardBloc, AdminDashboardState>(
        builder: (context, state) {
          return MenuSidebar(
            child: switch (state.child) {
              AdminDashboardChild.drinks => AdminDrinksView(),
              AdminDashboardChild.customDrinks => AdminCustomDrinksView(),
            },
          );
        },
      ),
    );
  }
}
