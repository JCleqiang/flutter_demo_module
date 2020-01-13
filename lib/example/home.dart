import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/ref/example_list.dart';

class Home extends StatefulWidget {
  String _title;

  Home(String title) {
    _title = title;
  }

  @override
  State<StatefulWidget> createState() {
    return HomePage(_title);
  }
}

class HomePage extends State<Home> {
  String _title;

  HomePage(String title) {
    _title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: ListView(
          children: exampleList.map((value) {
            return Card(
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: ListTile(
                title: Text(
                  value["title"],
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 51, 51, 51),
                  ),
                ),
                subtitle: Text(
                  value["des"],
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 102, 102, 102),
                  ),
                ),
              ),
            );
          }).toList(),
        ));
  }
}
