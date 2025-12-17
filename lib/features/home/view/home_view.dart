import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/features/home/bloc/home_bloc.dart';
import 'package:own_starbucks/features/home/widget/drinks_card.dart';
import 'package:own_starbucks/shared/colors.dart';
import 'package:own_starbucks/shared/images.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeDrinksInitRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.drinksStatus == HomeDrinksStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: AppColor.cream,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                backgroundColor: AppColor.white,
                elevation: 0,
                title: Image.asset(
                  AppImages.cup,
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text(
                      'STARBUCKS',
                      style: TextStyle(
                        color: AppColor.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    );
                  },
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined),
                    color: AppColor.black,
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Good Morning!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: AppColor.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'What would you like to drink today?',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColor.black.withValues(alpha: 0.6),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Search drinks...',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: AppColor.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final drink = state.drinks[index];
                    return DrinkCard(drink: drink);
                  }, childCount: state.drinks.length),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        );
      },
    );
  }
}
