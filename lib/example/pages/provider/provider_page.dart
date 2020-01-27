import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/pages/provider/Counter.dart';
import 'package:flutter_demo_module/example/pages/provider/second_page.dart';
import 'package:provider/provider.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          FlatButton(
            child: Text("下一页"),
            onPressed: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SecondPage();
                })),
          ),
        ],
      ),
      body: Center(
        child: Text("${Provider.of<Counter>(context).count}"),//1
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context).add();//2
        },
        child: Icon(Icons.add),
      ),
    );
  }
}