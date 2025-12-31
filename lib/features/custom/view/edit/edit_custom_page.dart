import 'package:flutter/material.dart';
import 'package:own_starbucks/features/custom/model/custom_drink.dart';
import 'package:own_starbucks/features/custom/view/edit/edit_custom_view.dart';

class EditCustomPage extends StatelessWidget {
  static String route = "edit_customize_route";
  final CustomDrink drink;

  const EditCustomPage({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return EditCustomView(drink: drink);
  }
}
