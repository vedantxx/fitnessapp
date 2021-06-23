import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class RecipeView extends StatefulWidget {
  final String postUrl;
  RecipeView({this.postUrl});
  @override
  _RecipeViewState createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {

  String finalUrl;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    //  implement initState

    super.initState();

    if(widget.postUrl.contains("http://")){
      finalUrl = widget.postUrl.replaceAll("http://", "https://");
    } else{
      finalUrl = widget.postUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Column(
          children:<Widget> [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xff213A50),
                      const Color(0xff071930),
                    ],
                    begin: FractionalOffset.topRight,
                    end: FractionalOffset.bottomLeft,
                  )
              ),
              padding: EdgeInsets.only(top: Platform.isIOS? 60 : 30,right: 24,left: 24,bottom: 16,),
              width: MediaQuery.of(context).size.width,

              child: Row(
                mainAxisAlignment: kIsWeb ? MainAxisAlignment.start : MainAxisAlignment.center,
                children: <Widget> [
                  Text("Recipe", style: TextStyle(
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
            ),
            Container(
              height: MediaQuery.of(context).size.height - 100,
              width: MediaQuery.of(context).size.width,
              child: WebView(
                initialUrl: finalUrl,
                onPageFinished: (val){
                  print(val);
                },
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController){
                  setState(() {
                    _controller.complete(webViewController);
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
