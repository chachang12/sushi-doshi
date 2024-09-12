import 'package:flutter/material.dart';
import 'package:sushi_doshi/components/navbar.dart';
import 'package:sushi_doshi/pages/cart_page.dart';
import 'package:sushi_doshi/pages/custom_rolls.dart';
import 'package:sushi_doshi/pages/shop_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  // navigation
  int _selectedIndex = 0;

  // method that updates selected index
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to navigate
  final List<Widget> _pages = [
    const ShopPage(),
    const CustomRollsPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      backgroundColor: const Color(0xFF19191B),
      appBar: AppBar(
        title: const Text('Menu', style: TextStyle(color: Colors.white)),
        elevation: 0,
        backgroundColor: const Color(0xFF19191B),
        iconTheme: const IconThemeData(
          color: Colors.white, // Change this to your desired color
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: Text('Order'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: Text('Contact Us'),
              onTap: () {
                // Handle item 1 tap
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}