import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:own_starbucks/admin/features/custom_drinks/view/custom_drinks_page.dart';
import 'package:own_starbucks/admin/features/dashboard/bloc/admin_dashboard_bloc.dart';
import 'package:own_starbucks/admin/features/drinks/view/drinks_page.dart';
import 'package:own_starbucks/shared/colors.dart';

class MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const MenuTile({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.green[700] : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.white : Colors.black87),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

class MenuSidebar extends StatefulWidget {
  const MenuSidebar({super.key, required this.child});

  final Widget child;

  @override
  State<MenuSidebar> createState() => _MenuSidebarState();
}

class _MenuSidebarState extends State<MenuSidebar> {
  String selectedMenu = 'drinks';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 250,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Dashboard',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MenuTile(
                title: 'Drinks',
                icon: Icons.local_cafe,
                isSelected: selectedMenu == 'drinks',
                onTap: () {
                  setState(() => selectedMenu = 'drinks');
                  context.read<AdminDashboardBloc>().add(
                    AdminDashboardChildChanged(
                      child: AdminDashboardChild.drinks,
                    ),
                  );
                },
              ),
              MenuTile(
                title: 'Custom Drinks',
                icon: Icons.emoji_food_beverage,
                isSelected: selectedMenu == 'custom_drinks',
                onTap: () {
                  setState(() => selectedMenu = 'custom_drinks');
                  context.read<AdminDashboardBloc>().add(
                    AdminDashboardChildChanged(
                      child: AdminDashboardChild.customDrinks,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24.0),
            color: AppColor.primary,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
