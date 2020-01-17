import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/pages/view_demo/dependnet/dep_search.dart';

//自定义有状态组件
class Demo_06 extends StatefulWidget {
  Demo_06({Key key}) : super(key: key);

  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<Demo_06> {
  List list = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("路由示例"),),
      body: ListView(
        children: <Widget>[
          Column(
              children: this.list.map((value) {return ListTile(title: Text(value),);}).toList()),
          SizedBox(height: 20),
          RaisedButton(
            child: Text("按钮"),
            onPressed: () {
              setState(() {
                list.add('新增数据' + list.length.toString());
              });
            },
          ),
          RaisedButton(
            onPressed: () {
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
          ),
        ],
      ),
    );
  }
}
