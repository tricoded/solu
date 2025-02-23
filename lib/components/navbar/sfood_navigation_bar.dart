import 'package:flutter/material.dart';
import 'package:food_app/pages/primary/groceries_recipes_page.dart';
import 'package:food_app/pages/primary/home_page.dart';
import 'package:food_app/pages/primary/profile_page.dart';
import 'package:food_app/pages/primary/updates_page.dart';
import 'package:food_app/themes/colors.dart';
import 'package:get/get.dart';

class SfoodNavigationBar extends StatelessWidget {
  const SfoodNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: AppColors.light4Color,
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
        
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home), 
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite), 
              label: "For you",
            ),
            NavigationDestination(
              icon: Icon(Icons.shopping_cart), 
              label: "Groceries",
            ),
            NavigationDestination(
              icon: Icon(Icons.person), 
              label: "Profile",
            ),
          ],
        ),
      ),
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController{
  final RxInt selectedIndex = 0.obs;
  final pages = [
    HomePage(),
    UpdatesPage(),
    GroceriesRecipesPage(),
    ProfilePage(),
  ];
}