import 'package:flutter/material.dart';
import 'package:own_starbucks/features/customize/view/add/add_customize_view.dart';

class AddCustomizePage extends StatelessWidget {
  static String route = "add_customize_route";
  const AddCustomizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddCustomizeView();
  }
}
