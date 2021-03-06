import 'package:flutter/material.dart';

/**
 Stack： 取代线性布局 (译者语：和Android中的LinearLayout相似)，Stack允许子 widget 堆叠， 
 你可以使用 Positioned 来定位他们相对于Stack的上下左右四条边的位置。Stacks是基于Web开发中的
 绝度定位（absolute positioning )布局模型设计的。
 */
class Demo_04 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("布局定位示例")), body: chooseBody());
  }

  Widget chooseBody() {
    // return LayoutDemo(); // Stack基本使用
    // return LayoutDemo2(); // Stack搭配Align
    // return LayoutDemo3(); // Stack搭配Positioned
    return LayoutDemo44(); // Wrap基本使用
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        // 需要注意的一点：alignment的左边是以children里面的控件最大的一个为坐标，谁的长以谁的y为坐标，谁的款以谁的x为坐标
        alignment: Alignment.bottomRight,
//        alignment: Alignment(1, 0.3), // (0, 0)表示居中，（1,1）表示在右下角，以此类推
        children: <Widget>[
          Container(
            height: 200,
            width: 200,
            color: Colors.red,
          ),
          Text('我是我是一个文本',
              style: TextStyle(fontSize: 30, color: Colors.purple)),
          Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class LayoutDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          children: <Widget>[
            Align(
              // 中点坐标是（0，0）
              alignment: Alignment(-1, -1),
              child: Icon(Icons.home, size: 40, color: Colors.white),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(Icons.search, size: 30, color: Colors.white),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.settings_applications,
                  size: 30, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class LayoutDemo3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: 10,
              child: Icon(Icons.home, size: 40, color: Colors.white),
            ),
            Positioned(
              bottom: 0,
              left: 100,
              child: Icon(Icons.search, size: 30, color: Colors.white),
            ),
            Positioned(
              right: 0,
              child: Icon(Icons.settings_applications,
                  size: 30, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class LayoutDemo44 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1400,
      color: Colors.pink,
      padding: EdgeInsets.all(10),
      child: Wrap(
        spacing: 10, // 行内控件之间距离
        runSpacing: 10, // 行与行之间距离
        direction: Axis.horizontal,
        // alignment:WrapAlignment.spaceEvenly,
        // runAlignment: WrapAlignment.center,
        children: <Widget>[
          MyButton("第1集1"),
          MyButton("第2集"),
          MyButton("第3集"),
          MyButton("第4集"),
          MyButton("第5集"),
        ],
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String text;
  const MyButton(this.text, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(this.text),
        textColor: Theme.of(context).accentColor,
        onPressed: () {});
  }
}
