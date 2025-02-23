import 'package:flutter/material.dart';

class ReviewCard extends StatefulWidget {
  final String imageUrl;
  final String profileUrl;
  final String userName;
  final double rating;
  final String userReview;

  const ReviewCard({
    super.key, 
    required this.imageUrl,
    required this.profileUrl,
    required this.userName,
    required this.rating,
    required this.userReview,
  });

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row for Image + Dish Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dish Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              // Dish Information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dish Name & Rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 14,
                          backgroundImage: AssetImage(widget.profileUrl), // User Profile Picture
                        ),

                        const SizedBox(width: 1),

                        Expanded(
                          child: Text(
                            widget.userName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(width: 5,),
                        
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 3),
                            Text(
                              "${widget.rating}",
                              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),

                    // Short Description
                    Text(
                      widget.userReview,
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
