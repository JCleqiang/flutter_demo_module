import 'package:flutter/material.dart';
import 'ref/listData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('FlutterDemo')),
      body: HomeContent(),
    ));
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(20),
      child: GridView.count(
        crossAxisSpacing: 20.0, //水平子 Widget 之间间距
        mainAxisSpacing: 20.0, //垂直子 Widget 之间间距
        padding: EdgeInsets.all(10),
        crossAxisCount: 3, //一行的 Widget 数量
        childAspectRatio: 0.9, //宽度和高度的比例
        children: this._getListData(),
      ),
    );
  }

  List<Widget> _getListData() {
    List<Widget> list = new List();

    for (var i = 0; i < listData.length; i++) {
      var value = listData[i];
      Container con = Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Image.network(value["imageUrl"]),
            SizedBox(height: 12),
            Text(
              value['title'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 11),
              maxLines: 1,
            )
          ],
        ),
        color: Colors.grey,
        // height: 400,  //设置高度没有反应
      );

      list.add(con);
    }
    return list;
  }
}
