import 'package:flutter/material.dart';
import 'package:sushi_doshi/components/sushi_roll_tile.dart';
import 'package:sushi_doshi/models/sushi.dart';
import 'package:sushi_doshi/pages/roll_info_page.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // List of sushi rolls
  final List<List<dynamic>> sushiRollList = [
    ["Salmon Nigiri", "assets/images/salmon_nigiri.png", 5.99, "Salmon atop white rice in a traditional style.", 5],
    ["Tuna Nigiri", "assets/images/tuna_nigiri.png", 5.99, "Tuna atop white rice in a traditional style.", 4],
    ["California Roll", "assets/images/california_roll.png", 5.99, "Fresh crab, avocado, and cucumber rolled in seaweed and rice.", 3],
  ];

  // List of ingredients for custom rolls
  final List<String> ingredients = [
    "Salmon",
    "Tuna",
    "Avocado",
    "Cucumber",
    "Crab",
    "Shrimp",
    "Eel",
  ];

  // Map to keep track of selected ingredients
  final Map<String, bool> selectedIngredients = {};

  @override
  void initState() {
    super.initState();
    // Initialize selectedIngredients map
    for (var ingredient in ingredients) {
      selectedIngredients[ingredient] = false;
    }
  }

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
                final sushi = Sushi(
                  name: sushiRollList[index][0],
                  imagePath: sushiRollList[index][1],
                  price: sushiRollList[index][2],
                  description: sushiRollList[index][3],
                  rating: sushiRollList[index][4],
                );
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RollInfoPage(sushi: sushi),
                      ),
                    );
                  },
                  child: SushiRollTile(sushi: sushi),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}