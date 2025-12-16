import 'package:flutter/material.dart';
import 'package:own_starbucks/features/customize/data/model/customized_drink.dart';
import 'package:own_starbucks/features/customize/view/edit/edit_customize_view.dart';

class EditCustomizePage extends StatelessWidget {
  static String route = "edit_customize_route";
  final CustomizedDrink drink;

  const EditCustomizePage({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return EditCustomizeView(drink: drink);
  }
}
