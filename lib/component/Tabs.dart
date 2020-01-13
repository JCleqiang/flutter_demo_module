import 'package:flutter/material.dart';
import 'package:flutter_demo_module/main_12_01/Home1.dart';
import 'package:flutter_demo_module/main_12_02/Home2.dart';
import 'package:flutter_demo_module/main_12_02/Home3.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList = [Home1(), Home2(), Home3(), ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text("Flutter Demo"),
//        leading: IconButton(
//            icon: Icon(Icons.close, color: Colors.white),
//            onPressed: () {
//              Future<int> future = FlutterPlugs02.dismissFlutterVC;
//
//              future.then((value){
//                if (value != 1) {
//                  Alert.showAlert(context, "关闭flutter失败，错误code：" + value.toString());
//                }
//              },onError: (e) {
//                Alert.showAlert(context, "关闭flutter异常1，错误code：" + "待开发");
//              }).catchError((e){
//                Alert.showAlert(context, "关闭flutter异常2，错误code：" + "待开发");
//              });
//            }
//        ),
//      ),
      appBar: AppBar(
        title: Text("adasda"),
      ),
      body: _pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (int index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("分类")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("设置"))
        ],
      ),
    );
  }
}