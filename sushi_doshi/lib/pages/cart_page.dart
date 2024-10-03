import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_doshi/models/cart_model.dart';
import 'package:sushi_doshi/models/sushi.dart';
import 'package:sushi_doshi/components/edit_ingredients_dialog.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19191B),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final sushi = cart.items[index];
                    return ListTile(
                      title: Text(sushi.name, style: const TextStyle(color: Colors.white)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\$${sushi.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.white)),
                          Text('Ingredients: ${sushi.ingredients.join(', ')}', style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              showEditIngredientsDialog(
                                context,
                                sushi,
                                cart,
                                index,
                                () {
                                  setState(() {}); // Trigger a rebuild
                                },
                              ); // Use the new component
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              cart.removeItem(index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(24.0),
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Implement order functionality
                  },
                  child: Text(
                    'Order Total: \$${cart.items.fold(0.0, (total, current) => total + current.price).toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}