import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_starbucks/admin/features/drinks/bloc/admin_drinks_bloc.dart';
import 'package:own_starbucks/admin/features/widgets/menu_sidebar.dart';

class AdminDrinkDetailsView extends StatelessWidget {
  final String drinkId;
  const AdminDrinkDetailsView({super.key, required this.drinkId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AdminDrinksBloc, AdminDrinksState>(
        builder: (context, state) {
          final drink = state.drinks.firstWhere(
            (drink) => drink.id.toString() == drinkId,
          );

          return MenuSidebar(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Drink Details',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.edit),
                        label: Text('Edit'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[700],
                          foregroundColor: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.delete),
                        label: Text('Delete'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[700],
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (drink.imageUrl != null)
                                  Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        drink.imageUrl!,
                                        height: 200,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                Container(
                                                  height: 200,
                                                  color: Colors.grey[300],
                                                  child: Icon(
                                                    Icons.broken_image,
                                                    size: 64,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                      ),
                                    ),
                                  ),
                                SizedBox(height: 16),
                                _DetailRow(
                                  label: 'ID',
                                  value: '${drink.id ?? '-'}',
                                ),
                                _DetailRow(
                                  label: 'Created At',
                                  value: drink.createdAt != null
                                      ? '${drink.createdAt!.day}/${drink.createdAt!.month}/${drink.createdAt!.year}'
                                      : '-',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Card(
                              elevation: 2,
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Basic Information',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    _DetailRow(
                                      label: 'Name',
                                      value: drink.name ?? '-',
                                    ),
                                    _DetailRow(
                                      label: 'Category',
                                      value: drink.category ?? '-',
                                    ),
                                    _DetailRow(
                                      label: 'Description',
                                      value: drink.description ?? '-',
                                    ),
                                    _DetailRow(
                                      label: 'Base Beverage',
                                      value: drink.baseBeverage ?? '-',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Card(
                              elevation: 2,
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Default Settings',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    _DetailRow(
                                      label: 'Size',
                                      value: drink.defaultSize ?? '-',
                                    ),
                                    _DetailRow(
                                      label: 'Ice Level',
                                      value: drink.defaultIceLevel ?? '-',
                                    ),
                                    _DetailRow(
                                      label: 'Sweetness Level',
                                      value:
                                          '${drink.defaultSweetnessLevel ?? '-'}',
                                    ),
                                    _DetailRow(
                                      label: 'Customizable',
                                      value: drink.isCustomizable == true
                                          ? 'Yes'
                                          : 'No',
                                      valueColor: drink.isCustomizable == true
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Card(
                              elevation: 2,
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ingredients',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    if (drink.ingredients == null ||
                                        drink.ingredients!.isEmpty)
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        child: Text(
                                          'No ingredients listed',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      )
                                    else
                                      ...drink.ingredients!.map((ingredient) {
                                        return Card(
                                          margin: EdgeInsets.only(bottom: 8),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              backgroundColor:
                                                  Colors.green[100],
                                              child: Icon(
                                                Icons.science,
                                                color: Colors.green[700],
                                              ),
                                            ),
                                            title: Text(
                                              ingredient.name ?? '-',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Type: ${ingredient.type ?? '-'}',
                                                ),
                                                Text(
                                                  'Quantity: ${ingredient.quantity ?? '-'} ${ingredient.unit ?? ''}',
                                                ),
                                              ],
                                            ),
                                            trailing: Chip(
                                              label: Text(
                                                ingredient.isRemovable == true
                                                    ? 'Removable'
                                                    : 'Required',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color:
                                                      ingredient.isRemovable ==
                                                          true
                                                      ? Colors.orange[700]
                                                      : Colors.blue[700],
                                                ),
                                              ),
                                              backgroundColor:
                                                  ingredient.isRemovable == true
                                                  ? Colors.orange[50]
                                                  : Colors.blue[50],
                                            ),
                                          ),
                                        );
                                      }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _DetailRow({required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: valueColor != null ? FontWeight.bold : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
