import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
            appBar: AppBar(
                title:Text("flutter demo"), 
              backgroundColor: Color.fromARGB(255, 188, 221, 78),
            ),
            body:HomeContent()
        )
    );
  }
}

class HomeContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        child: Text(
            '各位同学大家好我是主讲老师，各位同学大家好我是主讲老师大地',
            textAlign:TextAlign.center,
            overflow:TextOverflow.ellipsis ,
            maxLines: 10,
            textScaleFactor: 1.8,
            style:TextStyle(
                fontSize: 16.0,
                color:Colors.red,
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
                decoration:TextDecoration.lineThrough,
                decorationColor:Colors.white,
                decorationStyle: TextDecorationStyle.dashed,
                letterSpacing: 5.0

            )

        ),
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(
                color: Colors.blue,
                width: 2.0
            ),
            borderRadius: BorderRadius.all(
              //  Radius.circular(150),    //圆形
              Radius.circular(10),
            )
        ),
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