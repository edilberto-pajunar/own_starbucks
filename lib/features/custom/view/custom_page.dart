import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/app/app_locator.dart';
import 'package:own_starbucks/features/custom/bloc/custom_bloc.dart';
import 'package:own_starbucks/features/custom/view/custom_view.dart';

class CustomPage extends StatelessWidget {
  static String route = "customize_route";
  const CustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: getIt<CustomBloc>(), child: CustomView());
  }
}
