import 'package:flutter/material.dart';

class FavoritesManager extends ChangeNotifier {
  static final FavoritesManager _instance = FavoritesManager._internal();
  factory FavoritesManager() => _instance;
  FavoritesManager._internal();

  final List<Map<String, dynamic>> _favoriteRestaurants = [];
  final List<Map<String, dynamic>> _favoriteMeals = [];

  List<Map<String, dynamic>> get favoriteRestaurants => List.unmodifiable(_favoriteRestaurants);
  List<Map<String, dynamic>> get favoriteMeals => List.unmodifiable(_favoriteMeals);

  bool isRestaurantFavorite(String name) {
    return _favoriteRestaurants.any((r) => r['name'] == name);
  }

  void addRestaurant(Map<String, dynamic> restaurant) {
    if (!isRestaurantFavorite(restaurant['name'])) {
      _favoriteRestaurants.add(restaurant);
      notifyListeners();
    }
  }

  void removeRestaurant(String name) {
    _favoriteRestaurants.removeWhere((r) => r['name'] == name);
    notifyListeners();
  }

  bool isMealFavorite(String name) {
    return _favoriteMeals.any((m) => m['name'] == name);
  }

  void addMeal(Map<String, dynamic> meal) {
    if (!isMealFavorite(meal['name'])) {
      _favoriteMeals.add(meal);
      notifyListeners();
    }
  }

  void removeMeal(String name) {
    _favoriteMeals.removeWhere((m) => m['name'] == name);
    notifyListeners();
  }
} 