import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("ListView demo"),
              backgroundColor: Color.fromARGB(255, 188, 221, 78),
            ),
            body: HomeContent()));
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
        padding: EdgeInsets.all(20),
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.search,
              size: 40,
            ),
            title: Text("标题1"),
            subtitle: Text("子标题1")
          ),
          ListTile(
            leading: Image.asset(
              "images/01.png",
              fit: BoxFit.cover,
              width: 64,
              height: 64,
            ),
            title: Text("标题2"),
            subtitle: Text("子标题2"),
          )
        ],
      ),
    );
  }
}
