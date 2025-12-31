import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:own_starbucks/features/custom/bloc/custom_bloc.dart';
import 'package:own_starbucks/features/custom/model/custom_drink.dart';
import 'package:own_starbucks/features/custom/view/add/add_custom_page.dart';
import 'package:own_starbucks/features/custom/widget/custom_drink_card.dart';
import 'package:own_starbucks/shared/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomView extends StatefulWidget {
  const CustomView({super.key});

  @override
  State<CustomView> createState() => _CustomViewState();
}

class _CustomViewState extends State<CustomView> {
  @override
  void initState() {
    super.initState();
    context.read<CustomBloc>().add(CustomInitRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomBloc, CustomState>(
      builder: (context, state) {
        if (state.customizeStatus == CustomStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: AppColor.cream,
          appBar: AppBar(
            title: const Text(
              'My Custom Drinks',
              style: TextStyle(
                color: AppColor.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: AppColor.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: AppColor.black),
          ),
          body: state.customDrinks.isEmpty
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
                        'No custom drinks yet',
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
                    context.read<CustomBloc>().add(CustomInitRequested());
                  },
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    itemCount: state.customDrinks.length,
                    itemBuilder: (context, index) {
                      final drink = state.customDrinks[index];
                      return CustomDrinkCard(drink: drink);
                    },
                  ),
                ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              context.pushNamed(AddCustomPage.route);
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
