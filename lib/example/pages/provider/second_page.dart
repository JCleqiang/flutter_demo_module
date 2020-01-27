

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_module/example/pages/provider/Counter.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondPage"),
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