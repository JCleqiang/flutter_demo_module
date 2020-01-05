import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Flutter Demo')),
      body: HomePage(),
    ));
  }
}

//自定义有状态组件
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  // ignore: return_of_invalid_type
  _HomePageState createState() => _HomePageState2();
}

class _HomePageState extends State<HomePage> {
  int countNum = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 200),
        Chip(
          label: Text('${this.countNum}'),
        ),
        SizedBox(height: 20),
        RaisedButton(
          child: Text('按钮'),
          onPressed: () {
            setState(() {
              //只有有状态组件里面才有
              this.countNum++;
            });
          },
        )
      ],
    );
  }
}

class _HomePageState2 extends State<HomePage> {
  List list = new List();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
            children: this.list.map((value) {
          return ListTile(
            title: Text(value),
          );
        }).toList()),
        SizedBox(height: 20),
        RaisedButton(
          child: Text("按钮"),
          onPressed: () {
            setState(() {
              this.list.add('新增数据1');
              this.list.add('新增数据2');
            });
          },
        )
      ],
    );
  }
}
