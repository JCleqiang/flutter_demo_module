import 'package:flutter/material.dart';

/**
 Text：该 widget 可让创建一个带格式的文本。
 */

class Demo_01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("flutter demo"),
        ),
        body: chooseBody());
  }

  Widget chooseBody() {
    // return TextContent(); // Text控件示例
    return ImageContent(); // Image控件示例
  }
}

/*
 * Text控件
 */
class TextContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('abcdefghijklmnopqrstuvwxyz',
            /**
             * 文字对齐方式(不是文字控件在容器的布局),好像对单行不起作用
             */
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
            textScaleFactor: 1.8,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.red,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.lineThrough,
                decorationColor: Colors.white,
                decorationStyle: TextDecorationStyle.dashed,
                letterSpacing: 5.0)),
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(color: Colors.blue, width: 2.0),
            borderRadius: BorderRadius.all(
              //  Radius.circular(150),    //圆形
              Radius.circular(10),
            )),
        // padding:EdgeInsets.all(20),
        // padding:EdgeInsets.fromLTRB(10, 30, 5, 0)
        margin: EdgeInsets.fromLTRB(10, 30, 5, 0),

        // transform:Matrix4.translationValues(100,0,0)
        // transform:Matrix4.rotationZ(0.3)
        // transform:Matrix4.diagonal3Values(1.2, 1, 1)
        alignment: Alignment.bottomLeft,
      ),
    );
  }
}

/*
 * Image控件
 */
class ImageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.yellow,
        // borderRadius: BorderRadius.circular(100),
      ),
      // child: Image.asset(
      //   "images/01.png",
      //   fit: BoxFit.cover,
      // ),
      /**
       * fill 不裁剪，全部充满
       * contain 不裁剪 不充满
       * cover 裁剪 充满
       * fitWidth 不裁剪，宽度充满
       */
      child: Image.network(
        "http://dmimg.5054399.com/allimg/pkm/pk/22.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}
