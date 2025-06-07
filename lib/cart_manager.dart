import 'package:flutter/material.dart';

class CartManager extends ChangeNotifier {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final Map<String, Map<String, dynamic>> _cartMeals = {};

  List<Map<String, dynamic>> get cartMeals =>
      _cartMeals.values.where((m) => m['qty'] > 0).toList();

  int get totalPrice {
    int total = 0;
    for (final meal in cartMeals) {
      total += (meal['price'] as int) * (meal['qty'] as int);
    }
    return total;
  }

  void addMeal(Map<String, dynamic> meal, {int qty = 1}) {
    if (_cartMeals.containsKey(meal['name'])) {
      _cartMeals[meal['name']]!['qty'] += qty;
    } else {
      _cartMeals[meal['name']] = Map<String, dynamic>.from(meal);
      _cartMeals[meal['name']]!['qty'] = qty;
    }
    notifyListeners();
  }

  void updateMealQty(String name, int qty) {
    if (_cartMeals.containsKey(name)) {
      _cartMeals[name]!['qty'] = qty;
      if (qty <= 0) {
        _cartMeals.remove(name);
      }
      notifyListeners();
    }
  }

  void removeMeal(String name) {
    _cartMeals.remove(name);
    notifyListeners();
  }

  void clear() {
    _cartMeals.clear();
    notifyListeners();
  }
} 