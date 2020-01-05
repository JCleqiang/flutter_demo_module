import 'package:flutter/material.dart';

import 'ref/listData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('main_07_02')),
      body: LayoutDemo(),
    ));
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return IconContainer(Icons.home, color: Colors.orange, size: Size(160, 144));
    return Container(
      width: 300,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconContainer(
            Icons.home,
            color: Colors.green,
            size: Size(32, 32),
          ),
          IconContainer(
            Icons.search,
            color: Colors.yellow,
            size: Size(32, 32),
          ),
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  IconData iconData;
  Color color = Colors.grey;
  Size size = Size(60, 44);
  IconContainer(this.iconData, {this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.size.height,
      width: this.size.width,
      color: this.color,
      child: Center(
        child: Icon(this.iconData),
      ),
    );
  }
}
