import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/app/app_locator.dart';
import 'package:own_starbucks/features/customize/bloc/customize_bloc.dart';
import 'package:own_starbucks/features/customize/view/customize_view.dart';

class CustomizePage extends StatelessWidget {
  static String route = "customize_route";
  const CustomizePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<CustomizeBloc>(),
      child: CustomizeView(),
    );
  }
}
