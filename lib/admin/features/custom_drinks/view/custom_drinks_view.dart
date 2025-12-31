import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/admin/features/custom_drinks/bloc/admin_custom_drinks_bloc.dart';
import 'package:own_starbucks/admin/features/widgets/menu_sidebar.dart';

class AdminCustomDrinksView extends StatefulWidget {
  static const String route = 'admin_custom_drinks_route';
  const AdminCustomDrinksView({super.key});

  @override
  State<AdminCustomDrinksView> createState() => _AdminCustomDrinksViewState();
}

class _AdminCustomDrinksViewState extends State<AdminCustomDrinksView> {
  @override
  void initState() {
    super.initState();
    context.read<AdminCustomDrinksBloc>().add(AdminCustomDrinksInitRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCustomDrinksBloc, AdminCustomDrinksState>(
      builder: (context, state) {
        final customDrinks = state.customDrinks;

        return Container(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Custom Drinks Management',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text('Add Custom Drink'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Expanded(
                child: Card(
                  elevation: 2,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      child: DataTable(
                        headingRowColor: WidgetStateProperty.all(
                          Colors.grey[100],
                        ),
                        columns: [
                          DataColumn(
                            label: Text(
                              'ID',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Name',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Base Drink',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Milk Type',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Sugar Level',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Cup Size',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Total Price',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Created At',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Actions',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        rows: customDrinks.map((customDrink) {
                          return DataRow(
                            cells: [
                              DataCell(Text('${customDrink.id ?? '-'}')),
                              DataCell(
                                Row(
                                  children: [
                                    if (customDrink.baseDrinkPhoto != null)
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: Image.network(
                                          customDrink.baseDrinkPhoto!,
                                          width: 40,
                                          height: 40,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Icon(
                                                    Icons.broken_image,
                                                    size: 40,
                                                  ),
                                        ),
                                      ),
                                    SizedBox(width: 8),
                                    Text(customDrink.name ?? '-'),
                                  ],
                                ),
                              ),
                              DataCell(Text(customDrink.baseDrinkName ?? '-')),
                              DataCell(Text(customDrink.milkType ?? '-')),
                              DataCell(Text(customDrink.sugarLevel ?? '-')),
                              DataCell(Text(customDrink.cupSize ?? '-')),
                              DataCell(
                                Text(
                                  '\$${customDrink.totalPrice?.toStringAsFixed(2) ?? '0.00'}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700],
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(
                                  customDrink.createdAt != null
                                      ? '${customDrink.createdAt!.day}/${customDrink.createdAt!.month}/${customDrink.createdAt!.year}'
                                      : '-',
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.visibility,
                                        color: Colors.green,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {},
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
