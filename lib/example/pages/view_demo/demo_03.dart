import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/ref/data_list.dart';

class Demo_03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("GridView示例")), body: chooseBody());
  }

  Widget chooseBody() {
    // return GridViewDemo(); // GridView基本使用
    // return LayoutDemo2(); // Row和Expanded基本使用
    return LayoutDemo2_1(); // Column基本使用
    // return LayoutDemo2_2(); // Stack和Positioned的使用
  }
}

class GridViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cellW = (MediaQuery.of(context).size.width - (4 * 10)) / 3.0;
    // 计算宽高比，20是文字上下距离之和，14是文字高度
    var childAspectRatio = cellW / (cellW + 20 + 14);

    return GridView.count(
      crossAxisSpacing: 10.0, //水平子 Widget 之间间距
      mainAxisSpacing: 10.0, //垂直子 Widget 之间间距
      padding: EdgeInsets.all(10),
      crossAxisCount: 3, //一行的 Widget 数量
      // childAspectRatio:0.7,  //宽度和高度的比例
      children: this._getListData(cellW),
      // cell宽高比
      childAspectRatio: childAspectRatio,
      // childAspectRatio:
    );
  }

  List<Widget> _getListData(double cellW) {
    var tempList = dataList.map((value) {
      return Container(
        color: Colors.green,
        child: Column(
          children: <Widget>[
            Image.network(
              value['imageUrl'],
              fit: BoxFit.cover,
              height: cellW,
              width: cellW,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              value['title'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white),
              maxLines: 1,
            )
          ],
        ),
        // decoration: BoxDecoration(
        //     border: Border.all(
        //         color: Color.fromRGBO(233, 233, 233, 0.9), width: 1)),
        // // height: 400,  //设置高度没有反应
      );
    });

    print("llq002: " + tempList.toString());

    return tempList.toList();
  }
}

/**
 * 
 * Expanded有个属性flex，知道flex布局的都知道这个属性
 */
class LayoutDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return IconContainer(Icons.home, color: Colors.orange, size: Size(160, 144));
    return Container(
      height: 100, // 不设置宽度，宽度就是屏幕的宽度
      color: Colors.orange,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 15,
          ),
          IconContainer(
            Icons.home,
            color: Colors.green,
            size: Size(32, 32),
          ),
          SizedBox(
            width: 15,
          ),
          IconContainer(
            Icons.search,
            color: Colors.yellow,
            size: Size(32, 32),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                margin: EdgeInsets.fromLTRB(100, 0, 15, 0),
                color: Colors.red,
                child: Text("你大爷2", textAlign: TextAlign.end),
              ))
        ],
      ),
    );
  }
}

class LayoutDemo2_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          color: Colors.orange,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                height: 180,
                child: Image.network(
                  "https://www.itying.com/images/flutter/3.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.green,
                    height: 85,
                    child: Image.network(
                        "https://www.itying.com/images/flutter/4.png",
                        fit: BoxFit.cover),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 85,
                    child: Image.network(
                        "https://www.itying.com/images/flutter/5.png",
                        fit: BoxFit.cover),
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

/**
 * Stack一般使用Positioned包裹子控件及使用Align包裹子控件
 * Positioned有点类似于相对布局
 */
class LayoutDemo2_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
      width: MediaQuery.of(context).size.width,
      height: 64,
      color: Colors.orange,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 15,
            child: IconContainer(
              Icons.home,
              color: Colors.green,
              size: Size(32, 32),
            ),
          ),
          Positioned(
            left: 57,
            child: IconContainer(
              Icons.search,
              color: Colors.yellow,
              size: Size(32, 32),
            ),
          ),
          Positioned(
              right: 15,
              child: Container(
                color: Colors.white,
                height: 32,
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text("你大爷2"),
              )),
        ],
      ),
    );
  }
}

// 自定义小组件，传参
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
