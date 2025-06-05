import 'package:flutter/material.dart';
import 'package:formtest/page/cart_page.dart';
import 'package:formtest/page/favorites_page.dart';
import 'package:formtest/page/home_page.dart';
import 'package:formtest/page/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    MainHomePage(),
    FavoritesPage(),
    CartPage(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<IconData> icons = [
    Icons.home,
    Icons.favorite_border,
    Icons.shopping_cart_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {
              bool isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () => _onItemTapped(index),
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration:
                      isSelected
                          ? BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(50),
                          )
                          : null,
                  child: Icon(
                    icons[index],
                    color: isSelected ? Colors.white : Colors.grey,
                    size: 26,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
