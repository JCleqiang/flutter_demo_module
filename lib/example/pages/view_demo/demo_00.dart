import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/// 这个 widget 作用这个应用的顶层 widget.
///
/// 这个 widget 是无状态的，所以我们继承的是 [StatelessWidget].
/// 对应的，有状态的 widget 可以继承 [StatefulWidget]
class Demo_00 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 我们想使用 material 风格的应用，所以这里用 MaterialApp
    return Scaffold(
      appBar: AppBar(
        title: Text('首页02'),
      ),
      body: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          "你大爷2222",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 22,
            backgroundColor: Colors.white,
            color: Color.fromARGB(255, 22, 222, 222),
          ),
        )
    );
  }
}