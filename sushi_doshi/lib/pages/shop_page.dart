import 'package:flutter/material.dart';
import 'package:sushi_doshi/components/sushi_roll_tile.dart';
import 'package:sushi_doshi/models/sushi.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

  // List of sushi rolls
  List sushiRollList = [
    ["Salmon Nigiri", "assets/images/salmon_nigiri.png", 5.99, "Salmon atop white rice in a traditional style."],
    ["Tuna Nigiri", "assets/images/tuna_nigiri.png", 5.99, "Tuna atop white rice in a traditional style."],
    ["California Roll", "assets/images/california_roll.png", 5.99, "Fresh crab, avocado, and cucumber rolled in seaweed and rice."],
  ];

  // List of ingredients for custom rolls
  List<String> ingredients = [
    "Salmon",
    "Tuna",
    "Avocado",
    "Cucumber",
    "Crab",
    "Shrimp",
    "Eel",
  ];

  // Map to keep track of selected ingredients
  Map<String, bool> selectedIngredients = {};

  @override
  void initState() {
    // Initialize selectedIngredients map
    for (var ingredient in ingredients) {
      selectedIngredients[ingredient] = false;
    }
  }

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF19191B),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Specialty Rolls',
                style: TextStyle(
                  fontFamily: 'QuickSand',
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sushiRollList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return SushiRollTile(
                  sushi: Sushi(
                    name: sushiRollList[index][0],
                    imagePath: sushiRollList[index][1],
                    price: sushiRollList[index][2],
                    description: sushiRollList[index][3],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}