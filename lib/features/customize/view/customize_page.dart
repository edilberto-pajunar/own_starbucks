import 'package:flutter/material.dart';
import 'package:own_starbucks/features/customize/view/customize_view.dart';

class CustomizePage extends StatelessWidget {
  static String route = "customize_route";
  const CustomizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomizeView();
  }
}
