import 'package:flutter/material.dart';
import 'package:food_app/themes/body_text.dart';

class RestaurantsNearbyCard extends StatefulWidget {
  final String restaurantProfile;
  final String restaurantName;
  final String cuisine;
  final double rating;
  final int reviewsCount;
  final double distance;

  const RestaurantsNearbyCard({
    super.key, 
    required this.restaurantProfile,
    required this.restaurantName,
    required this.cuisine,
    required this.rating,
    required this.reviewsCount,
    required this.distance,
  });

  @override
  State<RestaurantsNearbyCard> createState() => _RestaurantsNearbyCardState();
}

class _RestaurantsNearbyCardState extends State<RestaurantsNearbyCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Stack(
        children: [
          // Background Card
          Container(
            width: double.infinity,
            height: 200, // Adjust as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 8,
                  spreadRadius: 2,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),

          // Restaurant Image (Fully Rounded)
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              widget.restaurantProfile,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),

          // Overlay Details (Restaurant Name, Rating, Distance)
          Positioned(
            bottom: 10,
            left: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Restaurant Name & Cuisine
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.restaurantName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.cuisine,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),

                  // Rating & Distance
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 4),
                      BodyText(text: widget.rating.toStringAsFixed(1)),
                      SizedBox(width: 10),
                      Icon(Icons.location_on, color: Colors.red, size: 18),
                      SizedBox(width: 4),
                      BodyText(text: "${widget.distance.toStringAsFixed(1)} km")
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}