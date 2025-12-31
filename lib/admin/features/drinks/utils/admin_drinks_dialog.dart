import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:own_starbucks/admin/features/drinks/bloc/admin_drinks_bloc.dart';
import 'package:own_starbucks/app/app_locator.dart';
import 'package:own_starbucks/widget/primary_button.dart';
import 'package:own_starbucks/widget/primary_text_field.dart';

class AdminDrinksDialog {
  static Future<void> showAddDrinkDialog(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    Uint8List? selectedImageBytes;
    String? selectedImageName;

    return showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: getIt<AdminDrinksBloc>(),
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

                return BlocListener<AdminDrinksBloc, AdminDrinksState>(
                  listenWhen: (previous, current) =>
                      previous.status != current.status,
                  listener: (context, state) {
                    if (state.status == AdminDrinksStatus.success) {
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
                          PrimaryTextField(
                            name: "description",
                            hint: "Description",
                            label: "Description",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a description';
                              }
                              return null;
                            },
                          ),
                          PrimaryTextField(
                            name: "category",
                            hint: "Category",
                            label: "Category",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a category';
                              }
                              return null;
                            },
                          ),
                          PrimaryTextField(
                            name: "baseBeverage",
                            hint: "Base Beverage",
                            label: "Base Beverage",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a base beverage';
                              }
                              return null;
                            },
                          ),
                          PrimaryTextField(
                            name: "defaultSize",
                            hint: "Default Size",
                            label: "Default Size",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a default size';
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
                            context.read<AdminDrinksBloc>().add(
                              AdminDrinkAddRequested(
                                name: fields['name']?.value ?? '',
                                category: fields['category']?.value ?? '',
                                baseBeverage:
                                    fields['baseBeverage']?.value ?? '',
                                defaultSize: fields['defaultSize']?.value ?? '',
                                description: fields['description']?.value ?? '',
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
