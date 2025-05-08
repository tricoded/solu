import 'package:flutter/material.dart';
import 'package:food_app/components/recipe/detailed_recipe_card.dart';

class FullRecipePage extends StatefulWidget {
  const FullRecipePage({super.key});

  @override
  State<FullRecipePage> createState() => _FullRecipePageState();
}

class _FullRecipePageState extends State<FullRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailedRecipeCard(
              imageUrl: "assets/images/kimbap.png",
              recipeName: "Kimbap",
              cookingTime: '30 min', 
              cuisineType: 'Korean', 
              ingredients: [
                'Rice', 
                'Seaweed', 
                'Carrots',
                'Cucumber',
                'Spinach',
                'Pickled radish',
                'Tuna', 
                'Eggs', 
                'Sesame oil', 
                'Salt', 
                'Soy sauce',
              ], 
              instructions: [
                'Cook the rice and let it cool.',
                'Prepare the vegetables by cutting them into thin strips.',
                'In a pan, scramble the eggs and set aside.',
                'Lay a sheet of seaweed on a bamboo mat.',
                'Spread a thin layer of rice on the seaweed, leaving a border at the top.',
                'Add the vegetables, tuna, and scrambled eggs on top of the rice.',
                'Roll the seaweed tightly using the bamboo mat.',
                'Slice the roll into bite-sized pieces.',
                'Serve with soy sauce for dipping.',
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}