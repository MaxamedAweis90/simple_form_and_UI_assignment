import 'package:flutter/material.dart';
import 'package:formtest/components/promo_banner.dart';
import 'package:formtest/page/test.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Collapsible greeting section
          SliverAppBar(
            expandedHeight: 75,
            floating: true,
            pinned: false,
            snap: false,
            automaticallyImplyLeading: false,

            backgroundColor: const Color.fromARGB(255, 255, 255, 255),

            elevation: 0,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
                    child: Column(
                      children: [
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
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Sticky search bar with no background
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickySearchBarDelegate(),
          ),

          // Main content
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 15),
                // 📢 Promo Banner
                const PromoBanner(),
                const SizedBox(height: 25),

                // 🍽️ Categories
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// Sticky search bar delegate with no background
class _StickySearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
      decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 15, right: 0),
        decoration: BoxDecoration(
          color: Colors.transparent, // Removed white background
          border: Border.all(
            color: const Color.fromARGB(255, 171, 179, 61).withOpacity(0.3),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey[600]),
            const SizedBox(width: 5),
            Expanded(
              child: TextField(
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Search your food or restaurant',
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                    height: 1.0,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              height: 100,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                icon: Transform.rotate(
                  angle: 1.5708,
                  child: const Icon(Icons.tune, color: Colors.white, size: 30),
                ),
                padding: EdgeInsets.zero,
                onPressed: () {
                  // Filter action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 70;

  @override
  double get minExtent => 70;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
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
