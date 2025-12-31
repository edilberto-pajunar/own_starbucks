import 'package:flutter/material.dart';
import 'package:own_starbucks/features/home/model/drink.dart';
import 'package:own_starbucks/shared/colors.dart';

class DrinkCard extends StatelessWidget {
  final Drink drink;

  const DrinkCard({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.grey.withValues(alpha: 0.3)),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  drink.imageUrl ?? '',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColor.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.local_cafe,
                        size: 40,
                        color: AppColor.primary,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drink.name ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      drink.description ?? '',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColor.black.withValues(alpha: 0.6),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            drink.category ?? '',
                            style: const TextStyle(
                              fontSize: 11,
                              color: AppColor.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        // Text(
                        //   '${drink.calories ?? 0} Cal',
                        //   style: TextStyle(
                        //     fontSize: 11,
                        //     color: AppColor.black.withValues(alpha: 0.5),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text(
                        //   '\$${drink.price?.toStringAsFixed(2) ?? '0.00'}',
                        //   style: const TextStyle(
                        //     fontSize: 20,
                        //     fontWeight: FontWeight.bold,
                        //     color: AppColor.primary,
                        //   ),
                        // ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: AppColor.primary,
                        //     borderRadius: BorderRadius.circular(8),
                        //   ),
                        //   child: IconButton(
                        //     onPressed: () {},
                        //     icon: const Icon(Icons.add),
                        //     color: AppColor.white,
                        //     iconSize: 20,
                        //     padding: const EdgeInsets.all(8),
                        //     constraints: const BoxConstraints(),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
