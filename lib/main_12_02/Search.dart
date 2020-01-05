import 'package:flutter/material.dart';

class Search extends StatelessWidget {

  final orderInfo;
  Search({this.orderInfo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("search")),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.orange,
              child: Text(
                "订单id = ${orderInfo != null? orderInfo["orderId"]: "空"}",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 22,
                  backgroundColor: Colors.white,
                  color: Color.fromARGB(255, 22, 222, 222),
                ),
              ),

            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("返回上一页面"),
            ),
          ],
        ),
      ),
    );
  }
}
