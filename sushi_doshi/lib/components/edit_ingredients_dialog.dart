import 'package:flutter/material.dart';
import 'package:sushi_doshi/models/sushi.dart';
import 'package:sushi_doshi/models/cart_model.dart';

void showEditIngredientsDialog(BuildContext context, Sushi sushi, CartModel cart, int index, VoidCallback onDialogClose) {
  final List<String> allIngredients = [
    "Salmon",
    "Tuna",
    "Avocado",
    "Cucumber",
    "Crab",
    "Shrimp",
    "Eel",
  ];
  List<String> selectedIngredients = List.from(sushi.ingredients);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: const Color(0xFF19191B),
            title: const Text('Edit Ingredients', style: TextStyle(color: Colors.white)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Wrap(
                  spacing: 8.0,
                  children: selectedIngredients.map((ingredient) {
                    return Chip(
                      label: Text(ingredient, style: const TextStyle(color: Colors.black)),
                      backgroundColor: Colors.white, // Set background color to white
                      onDeleted: () {
                        setState(() {
                          selectedIngredients.remove(ingredient);
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                    ),
                  ),
                  items: allIngredients.map((String ingredient) {
                    return DropdownMenuItem<String>(
                      value: ingredient,
                      child: Text(ingredient),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null && !selectedIngredients.contains(newValue)) {
                      setState(() {
                        selectedIngredients.add(newValue);
                      });
                    }
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel', style: TextStyle(color: Colors.white)),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    sushi.ingredients.clear();
                    sushi.ingredients.addAll(selectedIngredients);
                    cart.items[index] = sushi;
                  });
                  Navigator.of(context).pop();
                  onDialogClose(); // Call the callback function to trigger a rebuild
                },
                child: const Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    },
  );
}