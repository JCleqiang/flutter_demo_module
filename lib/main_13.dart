import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: AppBardemoPage3()));
  }
}

class AppBardemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: "Search",
            onPressed: () {
              print('menu Pressed');
            }),
        title: Text('FlutterDemo'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search",
              onPressed: () {
                print('Search Pressed');
              }),
          IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: "more_horiz",
              onPressed: () {
                print('more_horiz Pressed');
              })
        ],
      ),
      body: Text('这是 Appbar'),
    );
  }
}

class AppBardemoPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              title: Text('FlutterDemo'),
              bottom: TabBar(tabs: <Widget>[
                Tab(text: "热门"),
                Tab(text: "推荐"),
                Tab(text: "哈哈")
              ])),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  ListTile(title: Text("这是第一个 tab")),
                  ListTile(title: Text("这是第一个 tab")),
                  ListTile(title: Text("这是第一个 tab"))
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("这是第二个 tab")),
                  ListTile(title: Text("这是第二个 tab")),
                  ListTile(title: Text("这是第二个 tab"))
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("这是第二个 tab")),
                  ListTile(title: Text("这是第二个 tab")),
                  ListTile(title: Text("这是第二个 tab"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AppBardemoPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                tooltip: "Search",
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child:
                      TabBar(tabs: <Widget>[Tab(text: "热门"), Tab(text: "推荐")]),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  ListTile(title: Text("这是第一个 tab")),
                  ListTile(title: Text("这是第一个 tab")),
                  ListTile(title: Text("这是第一个 tab"))
                ],
              ),
              ListView(
                children: <Widget>[
                  ListTile(title: Text("这是第二个 tab")),
                  ListTile(title: Text("这是第二个 tab")),
                  ListTile(title: Text("这是第二个 tab"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
