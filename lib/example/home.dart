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
            // InkWell组件在用户点击时出现“水波纹”效果，InkWell简单用法：
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(value["route"]);
              },
              child: CardLayout(value),
            );
          }).toList(),
        ));
  }
}

// 自定义卡片
class CardLayout extends StatelessWidget {
  Map obj = null;

  CardLayout(Map obj) {
    this.obj = obj;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: ListTile(
        title: Text(
          obj["title"],
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 51, 51, 51),
          ),
        ),
        subtitle: Text(
          obj["des"],
          style: TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 102, 102, 102),
          ),
        ),
      ),
    );
  }
}
