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

