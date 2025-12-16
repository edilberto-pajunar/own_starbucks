import 'package:flutter/material.dart';
import 'package:own_starbucks/features/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  static String route = "home_route";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}
