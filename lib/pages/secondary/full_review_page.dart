import 'package:flutter/material.dart';

class FullReviewPage extends StatefulWidget {
  const FullReviewPage({super.key});

  @override
  State<FullReviewPage> createState() => _FullReviewPageState();
}

class _FullReviewPageState extends State<FullReviewPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, 
      child: Scaffold(
        appBar: AppBar(
          title: Text("R E V I E W S"),
        ),
        body: Column(
          children: [
            // Tab
            TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.reviews, color: Colors.black,),
                ),
                Tab(
                  icon: Icon(Icons.tag),
                )
              ],
            ),

            TabBarView(
              children: [
                // 1st Tab
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(""))
                      ),
                      child: Text("Review 1"),
                    ),
                  ],
                ),

                // 2nd Tab
                _taggedPosts(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _taggedPosts() {
    return GridView.builder(
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 3:4 Ratio Layout
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 3 / 4, // Fixed Ratio
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Open video player
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage("assets/images/video_placeholder.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }
    );
  }
}

// 2+4+6+3+3+4+4+7