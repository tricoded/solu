import 'package:flutter/material.dart';
import 'package:food_app/components/home/menu_card.dart';
import 'package:food_app/components/home/restaurant_card.dart';
import 'package:food_app/components/home/restaurants_nearby_card.dart';
import 'package:food_app/components/home/review_card.dart';
import 'package:food_app/pages/secondary/full_menu_page.dart';
import 'package:food_app/themes/colors.dart';
import 'package:food_app/themes/header_text.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover, 
                  image: AssetImage("assets/images/restaurantdupe.png"),
                ),
              ),
            ),
          ),

          Positioned(
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Return Icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),

                // Addtostarred Icon
                Wrap(
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.star_border,
                          color: Colors.black,
                        ),
                      ),

                    // More icon
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.more_vert_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // RESTAURANT NAME, LOCATION, CUISINE
          Positioned.fill(
            left: 0,
            right: 0,
            top: 100,
            child: SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 0.8,
                minChildSize: 0.8,
                maxChildSize: 0.8,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RestaurantCard(
                              restaurantName: "Restaurant Name", 
                              cuisine: "Cuisine", 
                              location: "Address", 
                              distance: 1, 
                              tags: ["Michelin", "Tourist Hotspot"], 
                              rating: 4.5, 
                              reviewsCount: 8000
                            ),
                        
                            SizedBox(height: 10,),
                            // Phone and Reservation Icons
                        
                        
                            // RESTAURANT MENU
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10,),
                              padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.light1Color,
                              ),
                              child: Column(
                                children: [
                                  HeaderText(text: "Menu", size: 18,),
                                  
                                  SizedBox(height: 5),
                        
                                  MenuCard(
                                    imageUrl: "assets/images/menusushione.png", 
                                    dishName: "Name of dish", 
                                    rating: 4, 
                                    ratersCount: 3000, 
                                    description: "Short description"
                                  ),
                        
                                  SizedBox(height: 5,),
                        
                                  MenuCard(
                                    imageUrl: "assets/images/menusushitwo.png", 
                                    dishName: "Sushi", 
                                    rating: 3.8, 
                                    ratersCount: 2500, 
                                    description: "Short description"
                                  ),
                        
                                  MenuCard(
                                    imageUrl: "assets/images/menusushithree.png", 
                                    dishName: "Sushi", 
                                    rating: 3.5, 
                                    ratersCount: 2000, 
                                    description: "Short description"
                                  ),
                        
                                  SizedBox(height: 10,),
                        
                                  Align(
                                    alignment: Alignment.center,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context, 
                                          MaterialPageRoute(
                                            builder: (context) => FullMenuPage(),
                                          ),
                                        );
                                      }, 
                                      child: Text("View more")),
                                  )
                                ],
                              ),
                            ),
                        
                            SizedBox(height: 5,),
                            // USER REVIEWS
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10,),
                              padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.light1Color,
                              ),
                              child: Column(
                                children: [
                                  ReviewCard(
                                    imageUrl: "assets/images/cupcakebanana.png", 
                                    profileUrl: "assets/images/profile.jpg", 
                                    userName: "username", 
                                    rating: 3.2, 
                                    userReview: "User's review on the food"
                                  ),
                        
                                  ReviewCard(
                                    imageUrl: "assets/images/cupcakestrawberry.png", 
                                    profileUrl: "assets/images/profile.jpg", 
                                    userName: "username", 
                                    rating: 3.2, 
                                    userReview: "User's review on the food"
                                  ),

                                  Align(
                                    alignment: Alignment.center,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context, 
                                          MaterialPageRoute(
                                            builder: (context) => FullMenuPage(),
                                          ),
                                        );
                                      }, 
                                      child: Text("View more")
                                    ),
                                  )
                                ],
                              ),
                            ),
                        
                            SizedBox(height: 5,),
                        
                            // FOR YOU - RESTAURANTS NEARBY
                            RestaurantsNearbyCard(
                              restaurantProfile: "assets/images/suggestedrestaurantone.png", 
                              restaurantName: "bibim.q", 
                              cuisine: "Korean", 
                              rating: 4.8, 
                              reviewsCount: 7000, 
                              distance: 0.8,
                            ),

                            RestaurantsNearbyCard(
                              restaurantProfile: "assets/images/suggestedrestauranttwo.png", 
                              restaurantName: "Le' Chef", 
                              cuisine: "French", 
                              rating: 4.62, 
                              reviewsCount: 10431, 
                              distance: 0.1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}