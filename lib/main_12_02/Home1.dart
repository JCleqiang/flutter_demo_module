import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugs_02/flutter_plugs_02.dart';

//自定义有状态组件
class Home1 extends StatefulWidget {
  Home1({Key key}) : super(key: key);

  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<Home1> {
  showAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text(message),
            actions: <Widget>[
              FlatButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text("确定")),

            ],
          );
        });
  }



  List list = new List();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }
}


//return ListView(
//children: <Widget>[
//Column(
//children: this.list.map((value) {
//return ListTile(
//title: Text(value),
//);
//}).toList()),
//SizedBox(height: 20),
//RaisedButton(
//child: Text("按钮"),
//onPressed: () {
//setState(() {
//this.list.add('新增数据1');
//this.list.add('新增数据2');
//});
//},
//),
//RaisedButton(
//onPressed: () {
//// 不带参数路由跳转
//Navigator.pushNamed(context, "/search");
//},
//child: Text("不带参跳转2->search页面"),
//),
//RaisedButton(
//onPressed: () {
//// 带参数路由跳转
//Navigator.pushNamed(context, "/search", arguments: {"orderId": "D3247238472394792374922"});
//},
//child: Text("带参跳转2->search页面"),
//),
//RaisedButton(
//onPressed: () {
//Navigator.pushNamed(context, "/button");
//},
//child: Text("button控件示例"),
//),
//RaisedButton(
//onPressed: () {
//Navigator.pushNamed(context, "/textField");
//},
//child: Text("textField控件示例"),
//),
//
//RaisedButton(
//onPressed: () {
//Navigator.pushNamed(context, "/formDemo");
//},
//child: Text("form表单示例"),
//),
//RaisedButton(
//onPressed: () {
//Navigator.pushNamed(context, "/list_praise");
//},
//child: Text("列表操作"),
//),
//RaisedButton(
//onPressed: () {
////            String battery = FlutterPlugs02.getBatteryLevel.toString();
//Future<String> future = FlutterPlugs02.getBatteryLevel;
//
//future.then((value){
////             showAlert(context, "电量结果：" + value);
//},onError: (e) {
//print("onError: \$e");
//showAlert(context, "onError");
//}).catchError((e){
//print("catchError: \$e");
//showAlert(context, "catchError");
//});
//},
//child: Text("电量监听"),
//),
//
//],
//);
