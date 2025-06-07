// restaurant_cards.dart
import 'package:flutter/material.dart';
import 'package:formtest/page/restaurant_detail_page.dart';
import 'package:formtest/favorites_manager.dart';

class RestaurantCards extends StatelessWidget {
  final String imagePath;
  final String name;
  final double rating;
  final String time;
  final String distance;
  final bool isNew;

  const RestaurantCards({
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
    return _RestaurantCardWithFavorite(
      imagePath: imagePath,
      name: name,
      rating: rating,
      time: time,
      distance: distance,
      isNew: isNew,
    );
  }
}

class _RestaurantCardWithFavorite extends StatefulWidget {
  final String imagePath;
  final String name;
  final double rating;
  final String time;
  final String distance;
  final bool isNew;

  const _RestaurantCardWithFavorite({
    required this.imagePath,
    required this.name,
    required this.rating,
    required this.time,
    required this.distance,
    required this.isNew,
  });

  @override
  State<_RestaurantCardWithFavorite> createState() => _RestaurantCardWithFavoriteState();
}

class _RestaurantCardWithFavoriteState extends State<_RestaurantCardWithFavorite> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = FavoritesManager().isRestaurantFavorite(widget.name);
    FavoritesManager().addListener(_updateFavoriteState);
  }

  @override
  void dispose() {
    FavoritesManager().removeListener(_updateFavoriteState);
    super.dispose();
  }

  void _updateFavoriteState() {
    setState(() {
      isFavorite = FavoritesManager().isRestaurantFavorite(widget.name);
    });
  }

  void _toggleFavorite() async {
    if (isFavorite) {
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
          content: const Text('Are you sure you want to remove this restaurant from your favorites?', style: TextStyle(fontSize: 16)),
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
        FavoritesManager().removeRestaurant(widget.name);
      }
    } else {
      FavoritesManager().addRestaurant({
        'name': widget.name,
        'image': widget.imagePath,
        'rating': widget.rating,
        'time': widget.time,
        'distance': widget.distance,
        'isNew': widget.isNew,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantDetailPage(
                  imagePath: widget.imagePath,
                  name: widget.name,
                  rating: widget.rating,
                  time: widget.time,
                  distance: widget.distance,
                ),
              ),
            );
          },
          child: Container(
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
                    widget.imagePath,
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
                        widget.name,
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
                            "${widget.rating} · ${widget.time} · ${widget.distance}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                  ),
                  onPressed: _toggleFavorite,
                ),
              ],
            ),
          ),
        ),
        if (widget.isNew)
          Positioned(
            top: 8,
            right: 18,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
                ],
              ),
              child: const Text(
                "New",
                style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
      ],
    );
  }
}
