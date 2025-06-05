// promo_banner.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
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
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
                Text(
                  "up to 75%",
                  style: GoogleFonts.libreBaskerville(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.local_offer, size: 18),
                  label: const Text(
                    "Claim Voucher",
                    style: TextStyle(fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    alignment: Alignment.centerLeft,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 0,
                    ),
                    minimumSize: const Size(0, 40),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
