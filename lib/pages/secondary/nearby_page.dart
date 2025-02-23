// home

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_app/themes/body_text.dart';
import 'package:food_app/themes/colors.dart';
import 'package:food_app/themes/dimensions.dart';
import 'package:food_app/themes/header_text.dart';

class NearbyPage extends StatefulWidget {
  const NearbyPage({super.key});

  @override
  State<NearbyPage> createState() => _NearbyPageState();
}

class _NearbyPageState extends State<NearbyPage> {
  List<String> pictureThumbnails = [
    "assets/images/japanese.jpg",
    "assets/images/drink.png",
    "assets/images/dessert.png",
    "assets/images/japanese.jpg",
    "assets/images/drink.png",
    "assets/images/dessert.png",
    "assets/images/japanese.jpg",
    "assets/images/drink.png",
    "assets/images/dessert.png",
    "assets/images/japanese.jpg",
  ];
  
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  // double _scaleFactor = 0.8;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
          _currentPageValue = pageController.page!;
        });
      },
    );
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: EdgeInsets.only(left: 30),
            child: HeaderText(text: "Nearby", size: 25,)),
        ),
        SizedBox(height: 3,),

        // SLIDER
        Container(
          color: Colors.transparent,
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            }
          ),
        ),

        // DOTS
        DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue.toInt(),
          decorator: DotsDecorator(
            activeColor: AppColors.light3Color,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        ),

        // RECOMMENDED TEXT
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HeaderText(text: "Suggested for you"),
            ],
          ),
        ),

        // LIST OF RESTAURANTS
        GridView.builder(
          padding: const EdgeInsets.all(8.0),
          shrinkWrap: true, // Allows it to fit inside SingleChildScrollView
          physics: NeverScrollableScrollPhysics(), // Prevents nested scrolling conflict
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 3 / 4, // Adjust this for item size
          ),
          itemCount: pictureThumbnails.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print("Tapped on ${pictureThumbnails[index]}");
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(pictureThumbnails[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Restaurant name",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          SizedBox(width: 3,),
                          Text(
                            "Rating",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                        ],
                      ),
                    )
                  ),

                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundImage: AssetImage("assets/images/profile.jpg"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    // Matrix4 matrix = Matrix4.identity();
    // if (index == _currentPageValue.floor()) {
    //   var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
    //   matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    // } else if (index == _currentPageValue.floor() + 1) {
    //   var currentScale = _scaleFactor + (_currentPageValue - index + 1) * ( 1 - _scaleFactor);
    //   matrix = Matrix4.diagonal3Values(1, currentScale, 1);
    // }
    return Stack(
      children: [
        Container(
          height: Dimensions.pageViewContainer,
          margin: EdgeInsets.only(left: 16, right: 16, top: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: index.isEven?Colors.grey:Colors.blueGrey,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/restaurantdupe.png"          
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 80,
            margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(top: 8, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderText(text: "Restaurant name", size: 22,),
    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.restaurant, size: 13,),
                      SizedBox(width: 5,),
                      BodyText(text: "Cuisine"),
                      SizedBox(width: 10,),
                      Icon(Icons.pin_drop, size: 13,),
                      SizedBox(width: 5,),
                      BodyText(text: "Minutes away")
                    ],
                  ),
                  SizedBox(height: 3,),
    
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        children: List.generate(
                          5, 
                          (index) {
                            return Icon(Icons.star, color: Colors.amber, size: 15,); 
                          },
                        ),
                      ),
                      SizedBox(width: 10,),
                      BodyText(text: "Rating"),
                      SizedBox(width: 10,),
                      BodyText(text: "Number of reviews"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),     
      ],
    );
  }
}

// matrix 1.30.00
// sizing 2.20.00

