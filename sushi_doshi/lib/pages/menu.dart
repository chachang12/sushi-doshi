import 'package:flutter/material.dart';
import 'package:sushi_doshi/pages/shop_page.dart';
import 'package:sushi_doshi/pages/custom_rolls.dart';
import 'package:sushi_doshi/pages/cart_page.dart';
import 'package:sushi_doshi/components/navbar.dart';

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

  // App bar titles corresponding to each page
  final List<String> _appBarTitles = [
    'Shop',
    'Custom Rolls',
    'Cart',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _appBarTitles[_selectedIndex],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF19191B),
        iconTheme: const IconThemeData(color: Colors.white), // Set hamburger icon color to white
      ),
      bottomNavigationBar: Navbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      backgroundColor: const Color(0xFF19191B),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                // Handle item 1 tap
              },
            ),
            ListTile(
              title: const Text(
                'Order',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                // Handle item 2 tap
              },
            ),
            ListTile(
              title: const Text(
                'Contact Us',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                // Handle item 3 tap
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}