import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/app/app_locator.dart';
import 'package:own_starbucks/features/home/bloc/home_bloc.dart';
import 'package:own_starbucks/features/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  static String route = "home_route";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: getIt<HomeBloc>(), child: HomeView());
  }
}
