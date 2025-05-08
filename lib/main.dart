import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_app/pages/secondary/full_recipe_page.dart';
import 'package:food_app/pages/secondary/restaurant_page.dart';
import 'package:get/get.dart';
// import 'package:food_app/components/navbar/sfood_navigation_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: FullRecipePage(),
      // SfoodNavigationBar(),
    );
  }
}
