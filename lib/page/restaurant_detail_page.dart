import 'package:flutter/material.dart';
import 'package:formtest/favorites_manager.dart';
import 'package:formtest/cart_manager.dart';
import 'package:formtest/page/cart_page.dart';

class RestaurantDetailPage extends StatefulWidget {
  final String imagePath;
  final String name;
  final double rating;
  final String time;
  final String distance;

  const RestaurantDetailPage({
    super.key,
    required this.imagePath,
    required this.name,
    required this.rating,
    required this.time,
    required this.distance,
  });

  @override
  State<RestaurantDetailPage> createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  int selectedCategory = 0;
  Map<String, int> cart = {};

  final List<String> categories = ['Burger', 'Fries', 'Coac', 'Meals'];

  final List<Map<String, dynamic>> foods = [
    {
      'name': 'Chicken Burger',
      'desc': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'price': 7,
      'rating': 4.5,
      'image': 'assets/images/burger.png',
    },
    {
      'name': 'Potato Corn Burger',
      'desc': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'price': 8,
      'rating': 4.0,
      'image': 'assets/images/burger.png',
    },
    {
      'name': 'Supreme Veggie Burger',
      'desc': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'price': 6,
      'rating': 4.3,
      'image': 'assets/images/burger.png',
    },
    {
      'name': 'Pizza Burger',
      'desc': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'price': 7,
      'rating': 4.5,
      'image': 'assets/images/burger.png',
    },
  ];

  int get totalPrice {
    int total = 0;
    cart.forEach((key, value) {
      final food = foods.firstWhere((f) => f['name'] == key);
      total += (food['price'] as int) * value;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      widget.imagePath,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 40,
                      left: 16,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          Text(' ${widget.rating}', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 10),
                          Icon(Icons.timer, color: Colors.grey, size: 18),
                          Text(' ${widget.time}', style: TextStyle(color: Colors.grey)),
                          const SizedBox(width: 10),
                          Icon(Icons.location_on, color: Colors.grey, size: 18),
                          Text(' ${widget.distance}', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ChoiceChip(
                                label: Text(categories[index]),
                                selected: selectedCategory == index,
                                onSelected: (selected) {
                                  setState(() {
                                    selectedCategory = index;
                                  });
                                },
                                selectedColor: Colors.black,
                                labelStyle: TextStyle(
                                  color: selectedCategory == index ? Colors.white : Colors.black,
                                ),
                                backgroundColor: Colors.grey[200],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: foods.length,
                        itemBuilder: (context, index) {
                          final food = foods[index];
                          final count = cart[food['name']] ?? 0;
                          final isMealFavorite = FavoritesManager().isMealFavorite(food['name']);
                          return Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    food['image'],
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        food['name'],
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.orange, size: 14),
                                          SizedBox(width: 3),
                                          Text('${food['rating']}', style: TextStyle(fontSize: 12)),
                                        ],
                                      ),
                                      Text(
                                        food['desc'],
                                        style: TextStyle(color: Colors.grey, fontSize: 11),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove_circle_outline),
                                      onPressed: count > 0
                                          ? () {
                                              setState(() {
                                                cart[food['name']] = count - 1;
                                                if (cart[food['name']] == 0) {
                                                  cart.remove(food['name']);
                                                }
                                                CartManager().updateMealQty(food['name'], cart[food['name']] ?? 0);
                                              });
                                            }
                                          : null,
                                    ),
                                    Text('$count', style: TextStyle(fontWeight: FontWeight.bold)),
                                    IconButton(
                                      icon: Icon(Icons.add_circle_outline),
                                      onPressed: () {
                                        setState(() {
                                          cart[food['name']] = count + 1;
                                          CartManager().addMeal(food, qty: 1);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(
                                    isMealFavorite ? Icons.favorite : Icons.favorite_border,
                                    color: isMealFavorite ? Colors.red : Colors.grey,
                                  ),
                                  onPressed: () async {
                                    if (isMealFavorite) {
                                      final shouldRemove = await showDialog<bool>(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                          title: Row(
                                            children: [
                                              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
                                              SizedBox(width: 8),
                                              Text('Remove Favorite'),
                                            ],
                                          ),
                                          content: const Text('Are you sure you want to remove this meal from your favorites?', style: TextStyle(fontSize: 16)),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(context, false),
                                              child: const Text('Cancel'),
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.red,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                              ),
                                              onPressed: () => Navigator.pop(context, true),
                                              child: const Text('Remove'),
                                            ),
                                          ],
                                        ),
                                      );
                                      if (shouldRemove == true) {
                                        setState(() {
                                          FavoritesManager().removeMeal(food['name']);
                                        });
                                      }
                                    } else {
                                      setState(() {
                                        FavoritesManager().addMeal(food);
                                      });
                                    }
                                  },
                                ),
                                Text('\$${food['price']}', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (cart.isNotEmpty)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('View Cart', style: TextStyle(color: Colors.white, fontSize: 18)),
                      Text(' 24$totalPrice', style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
