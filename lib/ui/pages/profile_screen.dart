import 'package:fitnessapp/model/meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          iconSize: 40,
          selectedIconTheme: IconThemeData(
            color: const Color(0xFF200087),
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12
          ),
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.home)),
              title: Text("Home", style: const TextStyle(color: Colors.white),),
            ),
            BottomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.search)),
              title: Text("Search", style: const TextStyle(color: Colors.white),),
            ),
            BottomNavigationBarItem(
                icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Icon(Icons.person)),
              title: Text("Profile", style: const TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget> [
          Positioned(
            top: 0,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(bottom: const Radius.circular(48)),
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              top: height * 0.38,
              left: 0,
              right: 0,
              child: Container(
                // color: Colors.grey,
                height: height * 0.50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0,
                          left: 32.0,
                          right: 16.0,
                        ),
                    child: Text("MEALS FOR TODAY",
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget> [
                          SizedBox(
                            width: 32.0,
                          ),
                          for(int i=0;i<meals.length;i++)
                            _MealCard(meal: meals[i],),
                        ],
                      ),
                    )),
                    SizedBox(height: 20,),
                    // Expanded(child: Container(
                    //   color: Colors.redAccent,
                    // ),),
                    Expanded(child: Container(
                      color: Colors.blueAccent,
                    ),),
                    // SizedBox(height: 20,),

                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class _MealCard extends StatelessWidget {
  // const _MealCard({Key? key}) : super(key: key);
  final Meal meal;

  const _MealCard({Key? key, required this.meal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0, bottom: 10.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children:<Widget> [
            Flexible(
              fit: FlexFit.tight,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(20),
                  ),
                  child: Image.asset(
                    meal.imagePath,
                    width: 150,
                    fit: BoxFit.fitWidth,
                  ),
                ),
            ),
            Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Container(

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        SizedBox(
                          height: 6,
                        ),
                        Text(meal.mealTime, style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.blueGrey,
                        ),),
                        Text(meal.name, style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.black,
                        ),),
                        Text("${meal.kiloCaloriesBurnt} kcal ", style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.blueGrey,
                        ),),
                        Row(
                          children: <Widget> [
                            Icon(Icons.access_time, color: Colors.black12,),
                            Text(
                              "${meal.timeTaken} min ", style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.blueGrey,
                            ),
                            ),
                          ],
                        ),
                        SizedBox(
                         height: 8.0,
                    )
              ],
            ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

