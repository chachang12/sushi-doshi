import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_doshi/models/sushi.dart';
import 'package:sushi_doshi/models/cart_model.dart';

class SushiRollTile extends StatelessWidget {
  final Sushi sushi;

  SushiRollTile({super.key, required this.sushi});

  void addToCart(BuildContext context) {
    Provider.of<CartModel>(context, listen: false).addItem(sushi);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${sushi.name} added to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFD6D0C4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Image of the sushi roll
            Image.asset(
              sushi.imagePath,
              height: 150,
              width: 150,
            ),
            // Price and name of the sushi roll
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(sushi.name, style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 1),
                      Text('\$${sushi.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey[600])),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => addToCart(context),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}