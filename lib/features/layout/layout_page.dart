import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:own_starbucks/features/layout/layout_view.dart';
import 'package:own_starbucks/shared/images.dart';

enum LayoutPageTab {
  home(title: "Home", icon: AppImages.cup, selectedIcon: AppImages.cup),

  drink(title: "Drink", icon: AppImages.drink, selectedIcon: AppImages.drink);

  final String title;
  final String icon;
  final String selectedIcon;

  const LayoutPageTab({
    required this.title,
    required this.icon,
    required this.selectedIcon,
  });
}

class LayoutPage extends StatelessWidget {
  static String route = "layout_route";
  const LayoutPage({required this.shell, super.key});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    return LayoutView(shell: shell);
  }
}
