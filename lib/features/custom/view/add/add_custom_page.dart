import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/app/app_locator.dart';
import 'package:own_starbucks/features/custom/bloc/custom_bloc.dart';
import 'package:own_starbucks/features/custom/view/add/add_custom_view.dart';

class AddCustomPage extends StatelessWidget {
  static String route = "add_customize_route";
  const AddCustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CustomBloc>(),
      child: const AddCustomView(),
    );
  }
}
