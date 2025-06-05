import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 👋 Greeting
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi Moha!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "📍 Location, Main City-Nagpur",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    const Icon(
                      Icons.notifications,
                      color: Colors.black54,
                      size: 38,
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        height: 16,
                        width: 16,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Text(
                            "5",
                            style: TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              height: 50, // Fixed height for better vertical alignment
              padding: const EdgeInsets.only(
                left: 15,
                right: 0,
              ), // Right padding reduced
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 4,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[600]), // Search icon
                  SizedBox(width: 5), // Space between icon and text
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.left, // Center text horizontally
                      decoration: InputDecoration(
                        isDense: true, // Reduces vertical padding
                        contentPadding:
                            EdgeInsets.zero, // Removes default padding
                        hintText: 'Search your food or restaurant',
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                          height: 1.0, // Fixes vertical alignment of hint text
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 100, // Matches TextField height
                    width: 50, // Square container
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: IconButton(
                      icon: Transform.rotate(
                        angle: 1.5708, // 90 degrees in radians (π/2 ≈ 0.5)
                        child: Icon(Icons.tune, color: Colors.white, size: 30),
                      ),
                      padding: EdgeInsets.zero, // Removes button padding
                      onPressed: () {
                        // Filter action
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 📢 Offer Banner
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    "assets/images/burger_banner.png",
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 160,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black54],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        stops: [0.5, 1],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Get Special Discount",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        Text(
                          "up to 75%",
                          style: GoogleFonts.libreBaskerville(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.local_offer, size: 18),
                          label: Text(
                            "Claim Voucher",
                            style: TextStyle(fontSize: 14),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            alignment:
                                Alignment
                                    .centerLeft, // Aligns icon and text to left
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            minimumSize: Size(
                              0,
                              40,
                            ), // Sets minimum button height
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // 🍽️ Categories
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("Show all", style: TextStyle(color: Colors.orange)),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryItem(title: 'Pizza'),
                  CategoryItem(title: 'Pan-cake'),
                  CategoryItem(title: 'Sandwich'),
                  CategoryItem(title: 'Ice-cream'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🍔 Restaurants List
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Restaurant",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("Show all", style: TextStyle(color: Colors.orange)),
              ],
            ),
            const SizedBox(height: 12),
            RestaurantCard(
              imagePath: 'assets/images/burger.png',
              name: 'Burger King',
              rating: 4.5,
              time: '25-35 mins',
              distance: '8 km',
              isNew: true,
            ),
            RestaurantCard(
              imagePath: 'assets/images/pizza.png',
              name: 'Pizzania',
              rating: 4.6,
              time: '20-25 mins',
              distance: '7 km',
            ),
            RestaurantCard(
              imagePath: 'assets/images/pizza.png',
              name: 'Pizzania',
              rating: 4.6,
              time: '20-25 mins',
              distance: '7 km',
            ),
          ],
        ),
      ),
    );
  }
}

// Category Widget
class CategoryItem extends StatelessWidget {
  final String title;

  const CategoryItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.orange[100],
            radius: 28,
            child: const Icon(Icons.fastfood, color: Colors.orange),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// Restaurant Card Widget
class RestaurantCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final double rating;
  final String time;
  final String distance;
  final bool isNew;

  const RestaurantCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.rating,
    required this.time,
    required this.distance,
    this.isNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      "$rating · $time · $distance",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isNew)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "New",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            ),
        ],
      ),
    );
  }
}
