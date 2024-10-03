import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:sushi_doshi/models/sushi.dart';

class CartModel extends ChangeNotifier {
  List<Sushi> _items = [];

  List<Sushi> get items => _items;

  CartModel() {
    _loadCart();
  }

  void addItem(Sushi sushi) {
    _items.add(sushi);
    _saveCart();
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    _saveCart();
    notifyListeners();
  }

  void editItem(int index, Sushi sushi) {
    _items[index] = sushi;
    _saveCart();
    notifyListeners();
  }

  void _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = jsonEncode(_items.map((sushi) => sushi.toJson()).toList());
    prefs.setString('cart', cartJson);
  }

  void _loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString('cart');
    if (cartJson != null) {
      final List<dynamic> cartList = jsonDecode(cartJson);
      _items = cartList.map((item) => Sushi.fromJson(item)).toList();
      notifyListeners();
    }
  }
}