import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/ref/data_list.dart';

class Demo_02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ListView demo")),
        body: HomeContent());
  }
}

// 1 死数据加载
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      height: 10000,
      child: ListView(
        children: listWidget,
      ),
    );
  }

  List<Widget> listWidget = [
    Container(
      color: Colors.orange,
      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
      height: 100,
      child: Text(
        "文本在Container居中",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 22),
      ),
    ),
    Container(
      height: 150,
      child: Image.asset(
        "assets/images/fei_ji.png",
        fit: BoxFit.cover,
      ),
    ),
    Container(
      child: ListTile(
          leading: Icon(Icons.search, size: 40),
          title: Text("标题1"),
          subtitle: Text("子标题1")),
    ),
    Image.network("https://www.itying.com/images/flutter/1.png"),
    Container(
      child: Text(
        '我是一个标题',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      height: 60,
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    ),
    Container(
      color: Colors.orange,
      child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: <Widget>[
              Text("Padding控件的使用", ),
              Image.network('https://www.itying.com/images/flutter/1.png',
                  fit: BoxFit.cover)
            ],
          )
      ),
    )
  ];
}

// 加载动态数据
class HomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dataList.length,
      itemBuilder: this._getListCellData,
    );
  }

  Widget _getListCellData(BuildContext context, int index) {
    return ListTile(
      title: Text(dataList[index]["title"]),
      subtitle: Text(dataList[index]["author"]),
      trailing: Image.network(dataList[index]["imageUrl"]),
    );
  }
}
