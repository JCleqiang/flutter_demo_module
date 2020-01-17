import 'package:flutter/material.dart';

class Search extends StatelessWidget {

  String orderId = "1";
  Search({this.orderId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("search")),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.orange,
            child: Text(
              "订单id = " + this.orderId,
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
    );
  }
}
