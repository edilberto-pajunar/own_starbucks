import 'package:flutter/material.dart';
import 'package:own_starbucks/features/custom/model/custom_drink.dart';
import 'package:own_starbucks/shared/colors.dart';

class EditCustomView extends StatefulWidget {
  final CustomDrink drink;

  const EditCustomView({super.key, required this.drink});

  @override
  State<EditCustomView> createState() => _EditCustomViewState();
}

class _EditCustomViewState extends State<EditCustomView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _baseDrinkController;

  late MilkType _selectedMilk;
  late SugarLevel _selectedSugar;
  late CupSize _selectedSize;
  late List<String> _selectedExtras;

  final List<String> _availableExtras = [
    'Extra Shot',
    'Whipped Cream',
    'Caramel Drizzle',
    'Vanilla Syrup',
    'Hazelnut Syrup',
    'Cinnamon',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.drink.name);
    _baseDrinkController = TextEditingController(
      text: widget.drink.baseDrink?.name,
    );

    _selectedMilk = MilkType.values.firstWhere(
      (milk) => milk.label == widget.drink.milkType,
      orElse: () => MilkType.whole,
    );

    _selectedSugar = SugarLevel.values.firstWhere(
      (sugar) => sugar.label == widget.drink.sugarLevel,
      orElse: () => SugarLevel.standard,
    );

    _selectedSize = CupSize.values.firstWhere(
      (size) => size.label == widget.drink.cupSize,
      orElse: () => CupSize.grande,
    );

    _selectedExtras = List.from(widget.drink.extras ?? []);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _baseDrinkController.dispose();
    super.dispose();
  }

  void _updateCustomDrink() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Drink updated successfully!'),
          backgroundColor: AppColor.primary,
        ),
      );
      Navigator.pop(context);
    }
  }

  void _deleteCustomDrink() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Drink'),
        content: const Text(
          'Are you sure you want to delete this custom drink?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Drink deleted successfully!'),
                  backgroundColor: Colors.red,
                ),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  double _calculateTotalPrice() {
    return 4.95 + _selectedSize.priceModifier + (_selectedExtras.length * 0.5);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cream,
      appBar: AppBar(
        title: const Text(
          'Edit Custom Drink',
          style: TextStyle(color: AppColor.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColor.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.black),
        actions: [
          IconButton(
            onPressed: _deleteCustomDrink,
            icon: const Icon(Icons.delete_outline),
            color: Colors.red,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Name Your Drink'),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'e.g., My Special Latte',
                        filled: true,
                        fillColor: AppColor.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColor.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Base Drink'),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _baseDrinkController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: AppColor.grey),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Cup Size'),
                    const SizedBox(height: 8),
                    _buildCupSizeSelector(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Milk Type'),
                    const SizedBox(height: 8),
                    _buildMilkTypeSelector(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Sugar Level'),
                    const SizedBox(height: 8),
                    _buildSugarLevelSelector(),
                    const SizedBox(height: 20),
                    _buildSectionTitle('Extras (+\$0.50 each)'),
                    const SizedBox(height: 8),
                    _buildExtrasSelector(),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
          _buildBottomBar(),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColor.black.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${_calculateTotalPrice().toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: _updateCustomDrink,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Update Drink',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),
    );
  }

  Widget _buildCupSizeSelector() {
    return Wrap(
      spacing: 8,
      children: CupSize.values.map((size) {
        final isSelected = _selectedSize == size;
        return ChoiceChip(
          label: Text(size.label),
          selected: isSelected,
          onSelected: (selected) {
            setState(() => _selectedSize = size);
          },
          selectedColor: AppColor.primary,
          backgroundColor: AppColor.white,
          labelStyle: TextStyle(
            color: isSelected ? AppColor.white : AppColor.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
          side: const BorderSide(color: AppColor.grey),
        );
      }).toList(),
    );
  }

  Widget _buildMilkTypeSelector() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: MilkType.values.map((milk) {
        final isSelected = _selectedMilk == milk;
        return ChoiceChip(
          label: Text(milk.label),
          selected: isSelected,
          onSelected: (selected) {
            setState(() => _selectedMilk = milk);
          },
          selectedColor: AppColor.primary,
          backgroundColor: AppColor.white,
          labelStyle: TextStyle(
            color: isSelected ? AppColor.white : AppColor.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
          side: const BorderSide(color: AppColor.grey),
        );
      }).toList(),
    );
  }

  Widget _buildSugarLevelSelector() {
    return Column(
      children: [
        Slider(
          value: SugarLevel.values.indexOf(_selectedSugar).toDouble(),
          min: 0,
          max: (SugarLevel.values.length - 1).toDouble(),
          divisions: SugarLevel.values.length - 1,
          activeColor: AppColor.primary,
          inactiveColor: AppColor.grey,
          onChanged: (value) {
            setState(() {
              _selectedSugar = SugarLevel.values[value.toInt()];
            });
          },
        ),
        Text(
          _selectedSugar.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.primary,
          ),
        ),
      ],
    );
  }

  Widget _buildExtrasSelector() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _availableExtras.map((extra) {
        final isSelected = _selectedExtras.contains(extra);
        return FilterChip(
          label: Text(extra),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedExtras.add(extra);
              } else {
                _selectedExtras.remove(extra);
              }
            });
          },
          selectedColor: AppColor.primary.withOpacity(0.2),
          backgroundColor: AppColor.white,
          checkmarkColor: AppColor.primary,
          labelStyle: TextStyle(
            color: isSelected ? AppColor.primary : AppColor.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
          side: BorderSide(
            color: isSelected ? AppColor.primary : AppColor.grey,
          ),
        );
      }).toList(),
    );
  }
}
