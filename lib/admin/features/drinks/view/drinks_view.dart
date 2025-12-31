import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:own_starbucks/admin/features/drinks/bloc/admin_drinks_bloc.dart';
import 'package:own_starbucks/admin/features/drinks/utils/admin_drinks_dialog.dart';
import 'package:own_starbucks/admin/features/drinks/view/drink_details_page.dart';
import 'package:own_starbucks/shared/colors.dart';

class AdminDrinksView extends StatefulWidget {
  static const String route = 'admin_drinks_route';
  const AdminDrinksView({super.key});

  @override
  State<AdminDrinksView> createState() => _AdminDrinksViewState();
}

class _AdminDrinksViewState extends State<AdminDrinksView> {
  @override
  void initState() {
    super.initState();
    context.read<AdminDrinksBloc>().add(AdminDrinksInitRequested());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<AdminDrinksBloc, AdminDrinksState>(
      builder: (context, state) {
        if (state.status == AdminDrinksStatus.loading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state.status == AdminDrinksStatus.error) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 48, color: Colors.red),
                SizedBox(height: 16),
                Text('Error: ${state.errorMessage}'),
              ],
            ),
          );
        }

        final drinks = state.drinks;

        return Container(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Drinks Management',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColor.black,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () =>
                        AdminDrinksDialog.showAddDrinkDialog(context),
                    icon: Icon(Icons.add),
                    label: Text('Add Drink'),
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
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(
                        theme.colorScheme.primaryContainer,
                      ),

                      columns: [
                        DataColumn(
                          label: Text(
                            'ID',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
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
                            'Category',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Base Beverage',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Default Size',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Customizable',
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
                      rows: drinks.map((drink) {
                        return DataRow(
                          onSelectChanged: (selected) {
                            context.goNamed(
                              AdminDrinkDetailsPage.route,
                              pathParameters: {"drink_id": drink.id.toString()},
                              extra: {"drink": drink},
                            );
                          },

                          cells: [
                            DataCell(Text('${drink.id ?? '-'}')),
                            DataCell(
                              Row(
                                children: [
                                  if (drink.imageUrl != null)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: Image.network(
                                        drink.imageUrl!,
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
                                  Expanded(child: Text(drink.name ?? '-')),
                                ],
                              ),
                            ),
                            DataCell(Text(drink.category ?? '-')),
                            DataCell(Text(drink.baseBeverage ?? '-')),
                            DataCell(Text(drink.defaultSize ?? '-')),
                            DataCell(
                              Icon(
                                drink.isCustomizable == true
                                    ? Icons.check_circle
                                    : Icons.cancel,
                                color: drink.isCustomizable == true
                                    ? Colors.green
                                    : Colors.red,
                                size: 20,
                              ),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.edit, color: Colors.blue),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
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
            ],
          ),
        );
      },
    );
  }
}
