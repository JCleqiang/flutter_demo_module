import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'index_page.dart';
import 'index_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //MultiProvider可以添加多个状态管理
    //包裹在MaterialApp外面，作用范围是全局
    return MultiProvider(
      providers: [
//      两种方式，这里使用ChangeNotifierProvider，因为可以自动调用dispose()方法，帮我释放资源
        ChangeNotifierProvider(builder: (_) {
          return IndexProvider();
        }),
//        ChangeNotifierProvider.value(value: IndexProvider())
      ],
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(primarySwatch: Colors.blue),
        home: IndexPage(),
      ),
    );
  }
}
