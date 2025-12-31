import 'package:flutter/material.dart';
import 'package:own_starbucks/features/custom/model/custom_drink.dart';
import 'package:own_starbucks/shared/colors.dart';

class CustomDrinkCard extends StatelessWidget {
  const CustomDrinkCard({super.key, required this.drink});

  final CustomDrink drink;

  @override
  Widget build(BuildContext context) {
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
                      drink.name ?? '',
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
                'Base: ${drink.baseDrink?.name}',
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
