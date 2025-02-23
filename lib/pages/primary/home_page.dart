import 'package:flutter/material.dart';
import 'package:food_app/pages/secondary/nearby_page.dart';
import 'package:food_app/themes/body_text.dart';
import 'package:food_app/themes/colors.dart';
import 'package:food_app/themes/header_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? _searchingWithQuery;

  late Iterable<Widget> _lastOptions = <Widget>[];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 50, bottom: 15,),
              padding: EdgeInsets.only(left: 23, right: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      HeaderText(text: "Indonesia"),
                      Row(
                        children: [
                          BodyText(text: "Jakarta"),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ],
                  ),
              
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.light3Color
                      ),
                      child: Icon(Icons.search, color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: NearbyPage(),
            ),
          ),
        ],
      ),
    );
  }
}