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
    ExerciseScreen(),
    // Home(),
    // SearchFragment(),
    // CategoriesFragment(),
    // Favsafragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFE9E9E9),
      body: _children[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          child: BottomNavyBar(

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
        ),
      ),
    );
  }
}
