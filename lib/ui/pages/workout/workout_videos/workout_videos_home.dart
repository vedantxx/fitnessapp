
import 'package:fitnessapp/widget/exercise_widget.dart';
import 'package:fitnessapp/widget/line_chart_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(

    body: Stack(
      children: [
        Container(

          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image2.png"),
              fit: BoxFit.cover,
            ),
          ),
          // color: Colors.black12,
        ),
        CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            buildAppBar(context),
            ExercisesWidget(),
          ],
        ),
      ],
    ),
  );

  SliverAppBar buildAppBar(BuildContext context) => SliverAppBar(
    flexibleSpace: FlexibleSpaceBar(background: LineChartWidget(),),
    expandedHeight: MediaQuery.of(context).size.height * 0.5,
    stretch: true,
    title: Text('Statistics'),
    centerTitle: true,
    pinned: true,
    leading: Icon(Icons.menu),

    actions: [
      Icon(Icons.person, size: 28),
      SizedBox(width: 12),
    ],
  );
}
