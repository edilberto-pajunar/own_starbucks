import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/app/app_locator.dart';
import 'package:own_starbucks/features/customize/bloc/customize_bloc.dart';
import 'package:own_starbucks/features/customize/view/add/add_customize_view.dart';

class AddCustomizePage extends StatelessWidget {
  static String route = "add_customize_route";
  const AddCustomizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CustomizeBloc>(),
      child: const AddCustomizeView(),
    );
  }
}
