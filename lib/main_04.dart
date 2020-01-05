import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
                title:Text("flutter demo"),

              backgroundColor: Color.fromARGB(255, 188, 221, 78),
            ),
            body:HomeContent()
        )
    );
  }
}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Image.asset(
        "images/01.png",
        fit: BoxFit.cover,
      ),
//      child: Image.network(
//        "http://dmimg.5054399.com/allimg/pkm/pk/22.jpg",
//        fit: BoxFit.cover,
//      ),
    );
  }

}