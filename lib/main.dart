import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return MaterialApp(home: Tabs());
    return MaterialApp(
      initialRoute: "/", // 初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute,
    );
  }
}
