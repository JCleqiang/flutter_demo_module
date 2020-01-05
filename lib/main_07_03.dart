import 'package:flutter/material.dart';

import 'ref/listData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('main_07_03')),
      body: LayoutDemo(),
    ));
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return IconContainer(Icons.home, color: Colors.orange, size: Size(160, 144));
    return Column(
      children: <Widget>[
        Container(
          height: 200,
          color: Colors.black,
        ),
        SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 180,
                child: Image.network("https://www.itying.com/images/flutter/3.png", fit: BoxFit.cover,),
              ),
            ),
            Expanded(
              flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 85,
                      child: Image.network("https://www.itying.com/images/flutter/4.png", fit: BoxFit.cover),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 85,
                      child: Image.network("https://www.itying.com/images/flutter/5.png", fit: BoxFit.cover),
                    ),
                  ],
                ),
            ),
          ],
        )
      ],
    );
  }
}
