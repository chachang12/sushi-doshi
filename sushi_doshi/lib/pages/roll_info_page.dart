import 'package:flutter/material.dart';
import 'package:sushi_doshi/models/sushi.dart';
import 'package:sushi_doshi/components/painted_star.dart'; // Import the StarRating widget

class RollInfoPage extends StatelessWidget {
  final Sushi sushi;

  const RollInfoPage({super.key, required this.sushi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19191B),
      appBar: AppBar(
        title: const Text('Information', style: TextStyle(color: Colors.white)),
        elevation: 0,
        backgroundColor: const Color(0xFF19191B),
        iconTheme: const IconThemeData(
          color: Colors.white, // Change this to your desired color
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(sushi.imagePath),
            const SizedBox(height: 16),
            Text(
              sushi.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            StarRating(
              value: sushi.rating,
              color: Colors.yellow, // You can change the color if needed
              starSize: 20, // You can change the size if needed
            ),
            const SizedBox(height: 8),
            Text(
              sushi.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Price: \$${sushi.price}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Ingredients: ${sushi.ingredients.join(', ')}', // New field
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}