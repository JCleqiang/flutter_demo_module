// 1.导入了Material UI组件库。Material是一种标准的移动端和web端的视觉设计语言， Flutter默认提供了一套丰富的Material风格的UI组件
import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/route.dart';

// 2.应用入口
// main函数使用了(=>)符号，这是Dart中单行函数或方法的简写
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This MaterialApp widget is the root of your application.
    return MaterialApp(
      // 移动设备使用这个 title 来表示我们的应用
      title: "flutter_demo示例",
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
    );
  }
}