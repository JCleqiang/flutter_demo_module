import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("ListView demo")), body: HomeContent()));
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.grey,
      height: 10000,
      width: 200,
      child: ListView(
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.green,
            child: Text(
              "111111",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22
              ),
            ),
          ),
          Container(
            height: 100,
            color: Colors.orange,
            child: Image.asset(
              "images/01.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 100,
            color: Colors.blue,
          ),
          Container(
            height: 100,
            color: Colors.deepPurpleAccent,
          ),
        ],
      ),
    );
  }
}
