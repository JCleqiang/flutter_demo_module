import 'package:flutter/material.dart';
import 'package:flutter_demo_module/main_12_01/Search.dart';

//自定义有状态组件
class Home1 extends StatefulWidget {
  Home1({Key key}) : super(key: key);

  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<Home1> {
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
        ),
        RaisedButton(
          onPressed: () {
            // 不带参数路由跳转
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Search(orderId: "",)),
            );
          },
          child: Text("不带参跳转->search页面"),
        ),
        RaisedButton(
          onPressed: () {
            // 带参数路由跳转
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Search(orderId: "D3247238472394792374923",)),
            );
          },
          child: Text("带参跳转->search页面"),
        )
      ],
    );
  }
}
