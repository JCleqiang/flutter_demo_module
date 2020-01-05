import 'package:flutter/material.dart';

import 'ref/listData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('main_07')),
      body: LayoutDemo(),
    ));
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.7,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: <Widget>[
        Image.network('https://www.itying.com/images/flutter/1.png',
            fit: BoxFit.cover),
        Image.network('https://www.itying.com/images/flutter/2.png',
            fit: BoxFit.cover),
        Image.network('https://www.itying.com/images/flutter/3.png',
            fit: BoxFit.cover),
        Image.network('https://www.itying.com/images/flutter/4.png',
            fit: BoxFit.cover),
        Image.network('https://www.itying.com/images/flutter/5.png',
            fit: BoxFit.cover),
        Image.network('https://www.itying.com/images/flutter/6.png',
            fit: BoxFit.cover),
        Image.network('https://www.itying.com/images/flutter/7.png',
            fit: BoxFit.cover),
      ],
    );
  }
}
