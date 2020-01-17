import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 移动设备使用这个 title 来表示我们的应用
      title: "flutter_demo示例",
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
    );
  }
}