import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:own_starbucks/admin/features/custom_drinks/bloc/admin_custom_drinks_bloc.dart';
import 'package:own_starbucks/admin/features/drinks/bloc/admin_drinks_bloc.dart';
import 'package:own_starbucks/app/app_locator.dart';
import 'package:own_starbucks/features/home/model/drink.dart';
import 'package:own_starbucks/shared/colors.dart';
import 'package:own_starbucks/widget/primary_button.dart';
import 'package:own_starbucks/widget/primary_text_field.dart';

class AdminCustomDrinkDialog {
  static Future<void> showAddCustomDrinkDialog(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    Uint8List? selectedImageBytes;
    String? selectedImageName;

    return showDialog(
      context: context,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(value: getIt<AdminCustomDrinksBloc>()),
            BlocProvider.value(value: getIt<AdminDrinksBloc>()),
          ],
          child: FormBuilder(
            onChanged: () => formKey.currentState?.save(),
            key: formKey,
            child: StatefulBuilder(
              builder: (context, setState) {
                Future<void> pickImage() async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (image != null) {
                    final bytes = await image.readAsBytes();
                    setState(() {
                      selectedImageBytes = bytes;
                      selectedImageName = image.name;
                    });
                  }
                }

                return BlocListener<
                  AdminCustomDrinksBloc,
                  AdminCustomDrinksState
                >(
                  listenWhen: (previous, current) =>
                      previous.status != current.status,
                  listener: (context, state) {
                    if (state.status == AdminCustomDrinksStatus.success) {
                      context.pop();
                    }
                  },
                  child: AlertDialog(
                    constraints: BoxConstraints(minWidth: 500),
                    title: Text("Add Drink"),
                    content: SingleChildScrollView(
                      child: Column(
                        spacing: 12,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PrimaryTextField(
                            name: "name",
                            hint: "Name",
                            label: "Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a name';
                              }
                              return null;
                            },
                          ),
                          Text("Base Drink"),
                          BlocSelector<
                            AdminDrinksBloc,
                            AdminDrinksState,
                            List<Drink>
                          >(
                            selector: (state) => state.drinks,
                            builder: (context, baseDrinks) {
                              return FormBuilderDropdown(
                                decoration: InputDecoration(
                                  labelText: "Base Drink",
                                  hintText: "Select Base Drink",
                                ),
                                dropdownColor: AppColor.primary,
                                name: "baseDrink",
                                items: baseDrinks
                                    .map(
                                      (drink) => DropdownMenuItem(
                                        value: drink.id,
                                        child: Text(drink.name ?? ''),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          ),
                          PrimaryTextField(
                            name: "milkType",
                            hint: "Enter Milk Type",
                            label: "Milk Type",
                          ),
                          PrimaryTextField(
                            name: "sugarLevel",
                            hint: "Enter Sugar Level",
                            label: "Sugar Level",
                          ),
                          PrimaryTextField(
                            name: "cupSize",
                            hint: "Enter Cup Size",
                            label: "Cup Size",
                          ),
                          PrimaryTextField(
                            name: "totalPrice",
                            hint: "Default Size",
                            label: "Total Price",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a total price';
                              }
                              return null;
                            },
                          ),
                          Text("Image"),

                          selectedImageBytes == null
                              ? PrimaryButton.outlined(
                                  text: "Upload Image",
                                  onPressed: () => pickImage(),
                                )
                              : GestureDetector(
                                  onTap: () => pickImage(),
                                  child: Image.memory(
                                    selectedImageBytes!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ],
                      ),
                    ),
                    actions: [
                      PrimaryButton.outlined(
                        text: "Cancel",
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      PrimaryButton.solid(
                        text: "Save",
                        onPressed: () {
                          if (formKey.currentState!.saveAndValidate()) {
                            final fields = formKey.currentState!.fields;
                            context.read<AdminCustomDrinksBloc>().add(
                              AdminCustomDrinkAddRequested(
                                name: fields['name']?.value ?? '',
                                baseDrinkId: fields["baseDrink"]?.value ?? 0,
                                milkType: fields['milkType']?.value ?? '',
                                sugarLevel: fields['sugarLevel']?.value ?? '',
                                cupSize: fields['cupSize']?.value ?? '',
                                totalPrice: double.parse(
                                  fields['totalPrice']?.value ?? '0',
                                ),
                                imageBytes: selectedImageBytes!,
                                filename: selectedImageName!,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
