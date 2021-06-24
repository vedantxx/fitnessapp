import 'dart:convert';
import 'dart:io';

import 'package:fitnessapp/api/api.dart';
import 'package:fitnessapp/model/recipe_model.dart';
import 'package:fitnessapp/ui/pages/search/recipe_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  List<RecipeModel> recipes = <RecipeModel>[];
  // var initialValue = 0;
  String ingridients;
  bool _loading = false;
  String query = "";
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState()
  // async
  {
    //  implement initState

    // recipes = widget.initialValue.length;
    super.initState();
    // RecipeModel data = await loadData();
    // this.setState(() {
    //   recipes = <RecipeModel>[data];
    // });
  }

  getRecipes(String query) async{
    Uri uri = Uri.parse("https://api.edamam.com/search?q=$query&app_id=$applicationId&app_key=$applicationKey&from=0&to=15"
      // "&calories=591-722&health=alcohol-free"
    );
    // recipes = null;
    var response = await http.Client().get(uri);
    // print("${response.toString()} this is response");
    Map<String,dynamic> jsonData = jsonDecode(response.body);
    jsonData["hits"].forEach((element){
      // print(element.toString());

      RecipeModel recipeModel = new RecipeModel();
      recipeModel = RecipeModel.fromMap(element["recipe"]);
      recipes.add(recipeModel);
    });
    // setState(() {});
    RecipeModel data = await getRecipes(query);
    this.setState(() {
      recipes = <RecipeModel>[data];
    });

    print("${recipes.toString()}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget> [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF20002B),
                      const Color(0xFF230387),
                    ],
                    begin: FractionalOffset.topRight,
                    end: FractionalOffset.bottomLeft,
                  )
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: !kIsWeb ? Platform.isIOS? 60 : 24 : 24,horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: kIsWeb ? MainAxisAlignment.start : MainAxisAlignment.center,
                      children: <Widget> [
                        Text("Fitness", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Overpass',

                        ),),
                        Text("App", style:  TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          fontFamily: 'Overpass',
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text("What will you cook today?", style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Overpass',
                    ),),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Just enter the ingredients you have we will show the best recipe for you",style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'OverpassRegular',
                    ),),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      // width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget> [
                          Expanded(
                            child: TextField(
                              controller: textEditingController,
                              decoration: InputDecoration(
                                hintText: "Enter Ingredients",
                                hintStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white.withOpacity(0.5),
                                  fontFamily: 'Overpass',
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),

                              ),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Overpass',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            onTap: () async {
                              if(textEditingController.text.isNotEmpty){
                                // recipes = null;
                                setState(() {
                                  _loading = true;
                                });

                                // getRecipes(textEditingController.text);

                                recipes = [];
                                Uri uri = Uri.parse("https://api.edamam.com/search?q=${textEditingController.text}&app_id=$applicationId&app_key=$applicationKey&from=0&to=15");
                                // "https://api.edamam.com/search?q=${textEditingController.text}&app_id=0f21d949&app_key=8bcdd93683d********5cb95e64ab26";
                                var response = await http.get(uri);
                                print(" $response this is response");
                                Map<String, dynamic> jsonData =
                                jsonDecode(response.body);
                                print("this is json Data $jsonData");
                                jsonData["hits"].forEach((element) {
                                  print(element.toString());
                                  RecipeModel recipeModel = new RecipeModel();
                                  recipeModel =
                                      RecipeModel.fromMap(element['recipe']);
                                  recipes.add(recipeModel);
                                  print(recipeModel.url);
                                });
                                setState(() {
                                  _loading = false;
                                });
                                print("just do it");
                              } else {
                                print("Enter value");
                              }
                            },
                            child: Container(
                              // padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color(0xffA2834D),
                                      const Color(0xffBC9A5F),

                                    ],
                                    begin: FractionalOffset.topRight,
                                    end: FractionalOffset.bottomLeft,
                                  )
                              ),
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget> [
                                  Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(

                      child: GridView(
                        shrinkWrap: true,

                        // padding: const EdgeInsets.all(20),

                        scrollDirection: Axis.vertical,
                        physics: ClampingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200.0,

                          mainAxisSpacing: 10.0,
                          // crossAxisSpacing: 10.0,
                        ),
                        children: List.generate(recipes.length, (index) {

                          return GridTile(
                            child: RecipeTile(
                              title: recipes[index].label,
                              desc: recipes[index].source,
                              imgUrl: recipes[index].image,
                              url: recipes[index].url,
                            ),
                          );
                        },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}

class RecipeTile extends StatefulWidget {
  // const RecipeTile({Key key}) : super(key: key);
  final String title,desc,imgUrl,url;
  RecipeTile({this.url,this.imgUrl,this.desc,this.title});

  @override
  _RecipeTileState createState() => _RecipeTileState();
}

class _RecipeTileState extends State<RecipeTile> {
  _launchUrl(String url) async {
    if(await canLaunch(url)){
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget> [
        GestureDetector(
          onTap: () {
            if(kIsWeb){
              _launchUrl(widget.url);
            } else {
              print(widget.url + "this is what we are going to see");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecipeView(
                        postUrl: widget.url,
                      )
                  )
              );
            }
          },
          child: Container(
            margin: EdgeInsets.all(8),
            child: Stack(
              children: <Widget> [
                Image.network(
                  widget.imgUrl,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: 200,
                  // height: 200,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white30,
                        Colors.white,
                      ],
                      begin: FractionalOffset.centerRight,
                      end: FractionalOffset.centerLeft,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              fontFamily: "Overpass"
                          ),
                        ),
                        Text(
                          widget.desc,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                            fontFamily: "OverpassRegular",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

}

class GradientCard extends StatelessWidget {
  final Color topColor;
  final Color bottomColor;
  final String topColorCode;
  final String bottomColorCode;

  GradientCard(
      {
        this.topColor,
        this.bottomColor,
        this.topColorCode,
        this.bottomColorCode
      }
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 160,
                  width: 180,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [topColor, bottomColor],
                          begin: FractionalOffset.topLeft,
                          end: FractionalOffset.bottomRight)),
                ),
                Container(
                  width: 180,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white30, Colors.white],
                          begin: FractionalOffset.centerRight,
                          end: FractionalOffset.centerLeft)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          topColorCode,
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        Text(
                          bottomColorCode,
                          style: TextStyle(fontSize: 16, color: bottomColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
