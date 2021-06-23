import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fitnessapp/ui/pages/home/profile_screen.dart';
import 'package:fitnessapp/ui/pages/home/workout_screen.dart';
import 'package:fitnessapp/ui/pages/search/search.dart';
import 'package:fitnessapp/ui/pages/workout/workout.dart';
import 'package:flutter/material.dart';

class MyBottomNavyBar extends StatefulWidget {
  const MyBottomNavyBar({Key key}) : super(key: key);

  @override
  _MyBottomNavyBarState createState() => _MyBottomNavyBarState();
}

class _MyBottomNavyBarState extends State<MyBottomNavyBar> {

  int currentIndex = 0;
  final List<Widget> _children = [
    ProfileScreen(),
    SearchScreen(),
    ExcerciseScreen(),
    // Home(),
    // SearchFragment(),
    // CategoriesFragment(),
    // Favsafragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavyBar(

        selectedIndex: currentIndex,
        onItemSelected: (index){
          setState(() {
            currentIndex = index;
          },
          );
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),

              activeColor: Colors.blueAccent,
              inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.person),
              title: Text('Categories'),
              activeColor: Colors.blueAccent,
              inactiveColor: Colors.black
          ),
          // BottomNavyBarItem(
          //   icon: Icon(Icons.favorite_border),
          //   title: Text('Favorites'),
          //   activeColor: Colors.blueAccent,
          //   inactiveColor: Colors.black,
          //
          // ),
        ],

      ),
    );
  }
}
