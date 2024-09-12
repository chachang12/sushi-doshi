import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';


class Navbar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const Navbar({super.key, required this.onTabChange});
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: GNav(
        gap: 8,
        color: Colors.grey[600],
        onTabChange: (value) => onTabChange!(value),
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[800],
        tabBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        padding: const EdgeInsets.all(20),
        tabs: const [
          GButton(
            icon: Icons.restaurant_menu,
            text: 'Order',
          ),
          GButton(
            icon: Icons.edit,
            text: 'Customize',
          ),
          GButton(
            icon: Icons.shopping_cart,
            text: 'Cart',
          ),
        ],
      ),
    );
  }
}
