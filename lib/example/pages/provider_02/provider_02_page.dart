
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'count_block.dart';

class Provider02Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Provider02PageState();
  }
}

class Provider02PageState extends State<Provider02Page> {
  @override
  Widget build(BuildContext context) {
    // 两种方式Provider()和Provider.value()，使用基本差不多，
    // 区别在于Provider()提供dispose参数，可以在传递一个方法销毁的时候被调用，
    // 方便StatelessWidget释放资源
    return Provider<CountBlock>(
        create: (context) {
          return CountBlock();
        },
        dispose: (context, value) {
          value.dispose();
        },
        child: MaterialApp(
          home: HomePage(),
        ),
    );
  }

}

// 使用ValueListenableProvider，它只支持单一数据的监听，有两种方式，
// 一种ValueListenableProvider.value()，另一种ValueListenableProvider()，两种方式几乎是相同的。

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: StreamBuilder(
          stream: Provider.of<CountBlock>(context).stream,
          initialData: 0,
          builder: (context, snapshot) {
            return Center(child: Text("${snapshot.data}"));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    CountBlock bloc = Provider.of<CountBlock>(context);
    return Scaffold(
      appBar: AppBar(title: Text("第二页")),
      body: StreamBuilder(
          stream: bloc.stream,
          initialData: bloc.count,
          builder: (context, snapshot) {
            return Center(child: Text("${snapshot.data}"));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.add(),
        child: Icon(Icons.add),
      ),
    );
  }
}