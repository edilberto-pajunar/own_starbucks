import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:own_starbucks/features/customize/bloc/customize_bloc.dart';
import 'package:own_starbucks/features/customize/model/customized_drink.dart';
import 'package:own_starbucks/features/customize/view/add/add_customize_page.dart';
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
    final mockCustomizedDrinks = [
      CustomizedDrink(
        id: '1',
        customName: 'Morning Energy Boost',
        baseDrink: 'Caffe Latte',
        milkType: MilkType.oat.label,
        sugarLevel: SugarLevel.low.label,
        cupSize: CupSize.grande.label,
        extras: ['Extra Shot', 'Cinnamon'],
        totalPrice: 6.45,
        createdAt: DateTime.now(),
      ),
      CustomizedDrink(
        id: '2',
        customName: 'Sweet Dreams',
        baseDrink: 'Caramel Macchiato',
        milkType: MilkType.whole.label,
        sugarLevel: SugarLevel.full.label,
        cupSize: CupSize.venti.label,
        extras: ['Whipped Cream', 'Caramel Drizzle', 'Vanilla Syrup'],
        totalPrice: 7.45,
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];

    return BlocBuilder<CustomizeBloc, CustomizeState>(
      builder: (context, state) {
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
              ? _buildEmptyState(context)
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.customizedDrinks.length,
                  itemBuilder: (context, index) {
                    final drink = state.customizedDrinks[index];
                    return _buildCustomizedDrinkCard(context, drink);
                  },
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

  Widget _buildEmptyState(BuildContext context) {
    return Center(
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
    );
  }

  Widget _buildCustomizedDrinkCard(
    BuildContext context,
    CustomizedDrink drink,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.grey.withValues(alpha: 0.3)),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to edit page
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      drink.customName ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '\$${drink.totalPrice?.toStringAsFixed(2) ?? '0.00'}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.primary,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.chevron_right, color: AppColor.grey),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Base: ${drink.baseDrink}',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColor.black.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  _buildInfoChip(drink.cupSize ?? ''),
                  _buildInfoChip(drink.milkType ?? ''),
                  _buildInfoChip(drink.sugarLevel ?? ''),
                ],
              ),
              if (drink.extras?.isNotEmpty ?? false) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 4,
                  runSpacing: 4,
                  children: drink.extras!.map((extra) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        extra,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColor.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.cream,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColor.grey.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, color: AppColor.black),
      ),
    );
  }
}
