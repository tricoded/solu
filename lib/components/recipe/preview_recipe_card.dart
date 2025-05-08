import 'package:flutter/material.dart';

class RecipeCard extends StatefulWidget {
  final String imageUrl;
  final String recipeName;
  final String mealType;
  final int prepTime;
  final int cookingTime;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.recipeName,
    required this.mealType,
    required this.prepTime,
    required this.cookingTime,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.recipeName,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 18,),
                    Row(
                      children: [
                        Text(
                          widget.mealType,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 18,),
                    Row(
                      children: [
                        Text(
                          "${widget.prepTime} min prep",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text(
                          "${widget.cookingTime} min cook",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ))
            ],
          ),
        ],
      ),
    );
  }
}