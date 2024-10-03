import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_doshi/models/sushi.dart';
import 'package:sushi_doshi/models/cart_model.dart';

class CustomRollsPage extends StatefulWidget {
  const CustomRollsPage({super.key});

  @override
  State<CustomRollsPage> createState() => _CustomRollsPageState();
}

class _CustomRollsPageState extends State<CustomRollsPage> {
  final List<String> ingredients = [
    "Salmon",
    "Tuna",
    "Avocado",
    "Cucumber",
    "Crab",
    "Shrimp",
    "Eel",
  ];

  final List<String> selectedIngredients = ['Rice', 'Seaweed', 'Wasabi'];
  final _formKey = GlobalKey<FormState>();

  void _addIngredient(String ingredient) {
    setState(() {
      if (!selectedIngredients.contains(ingredient)) {
        selectedIngredients.add(ingredient);
      }
    });
  }

  void _removeIngredient(String ingredient) {
    setState(() {
      selectedIngredients.remove(ingredient);
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Sushi customRoll = Sushi(
        name: 'Custom Roll',
        description: '',
        price: 8.99,
        imagePath: '',
        rating: 0,
        ingredients: List.from(selectedIngredients), // Ensure a copy of the list is used
      );

      // Add the custom roll to the cart
      Provider.of<CartModel>(context, listen: false).addItem(customRoll);

      // Show a confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Custom Roll added to cart!')),
      );

      // Clear the selected ingredients
      setState(() {
        selectedIngredients.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Custom Roll'),
        backgroundColor: const Color(0xFF19191B),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: const Color(0xFF19191B),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Ingredients:',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange), // Change this to your desired color
                  ),
                ),
                items: ingredients.map((String ingredient) {
                  return DropdownMenuItem<String>(
                    value: ingredient,
                    child: Text(ingredient),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    _addIngredient(newValue);
                  }
                },
                validator: (value) {
                  if (selectedIngredients.isEmpty) {
                    return 'Please select at least one ingredient';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8.0,
                children: selectedIngredients.map((ingredient) {
                  return Chip(
                    label: Text(ingredient),
                    backgroundColor: Colors.white,
                    onDeleted: () => _removeIngredient(ingredient),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Create Custom Roll',
                      style: TextStyle(color: Color(0xFF19191B))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}