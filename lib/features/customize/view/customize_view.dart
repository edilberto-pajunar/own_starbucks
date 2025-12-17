import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:own_starbucks/features/customize/bloc/customize_bloc.dart';
import 'package:own_starbucks/features/customize/model/customized_drink.dart';
import 'package:own_starbucks/features/customize/view/add/add_customize_page.dart';
import 'package:own_starbucks/features/customize/widget/customized_drink_card.dart';
import 'package:own_starbucks/shared/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomizeView extends StatefulWidget {
  const CustomizeView({super.key});

  @override
  State<CustomizeView> createState() => _CustomizeViewState();
}

class _CustomizeViewState extends State<CustomizeView> {
  @override
  void initState() {
    super.initState();
    context.read<CustomizeBloc>().add(CustomizeInitRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomizeBloc, CustomizeState>(
      builder: (context, state) {
        if (state.customizeStatus == CustomizeStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: AppColor.cream,
          appBar: AppBar(
            title: const Text(
              'My Customized Drinks',
              style: TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: AppColor.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: AppColor.black),
          ),
          body: state.customizedDrinks.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_cafe_outlined,
                        size: 80,
                        color: AppColor.grey.withValues(alpha: 0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No customized drinks yet',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Create your first custom drink!',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColor.black.withValues(alpha: 0.4),
                        ),
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    context.read<CustomizeBloc>().add(CustomizeInitRequested());
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemCount: state.customizedDrinks.length,
                    itemBuilder: (context, index) {
                      final drink = state.customizedDrinks[index];
                      return CustomizedDrinkCard(drink: drink);
                    },
                  ),
                ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              context.pushNamed(AddCustomizePage.route);
            },
            backgroundColor: AppColor.primary,
            icon: const Icon(Icons.add, color: AppColor.white),
            label: const Text(
              'Create Drink',
              style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
