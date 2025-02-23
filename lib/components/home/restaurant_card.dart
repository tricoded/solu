import 'package:flutter/material.dart';
import 'package:food_app/themes/body_text.dart';
import 'package:food_app/themes/header_text.dart';

class RestaurantCard extends StatefulWidget {
  final String restaurantName;
  final String cuisine;
  final String location;
  final double distance;
  final List<String> tags;
  final double rating;
  final int reviewsCount;

  const RestaurantCard({
    super.key, 
    required this.restaurantName,
    required this.cuisine,
    required this.location,
    required this.distance,
    required this.tags,
    required this.rating,
    required this.reviewsCount,
  });

  @override
  State<RestaurantCard> createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HeaderText(text: widget.restaurantName, size: 22,),


            ],
          ),

          SizedBox(height: 5,),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.restaurant, size: 13,),
              SizedBox(width: 5,),
              BodyText(text: widget.cuisine),

              SizedBox(width: 10,),

              Icon(Icons.map, size: 13,),
              SizedBox(width: 5,),
              BodyText(text: "${widget.distance.toStringAsFixed(1)} km")
            ],
          ),

          SizedBox(height: 5,),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Wrap(
                children: List.generate(
                  widget.rating.toInt(), 
                  (index) {
                    return Icon(Icons.star, color: Colors.amber, size: 15,); 
                  },
                ),
              ),

              SizedBox(width: 10,),
              BodyText(text: widget.rating.toStringAsFixed(1)),

              SizedBox(width: 10,),
              BodyText(text: widget.reviewsCount.toString()),
            ],
          ),

          SizedBox(height: 5,),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 5,),
              BodyText(text: widget.location)
            ],
          ),
        ],
      ),
    );
  }
}