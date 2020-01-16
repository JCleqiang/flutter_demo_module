import 'package:flutter/material.dart';


class Demo_05 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return AppBardemoPage2();
  }
}

// AppBar里面的一些属性示例
class AppBardemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            tooltip: "Search",
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text('appbar示例'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search Pressed');
              }),
          IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                print('more_horiz Pressed');
              })
        ],
      ),
      body: Text('这是 Appbar'),
    );
  }
}

// DefaultTabController、TabBarView的用法
class AppBardemoPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              title: Text('DefaultTabController'),
              bottom: TabBar(tabs: <Widget>[
                Tab(text: "热门"),
                Tab(text: "推荐"),
                Tab(text: "哈哈")
              ])),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: _listWidget(0)
              ),
              ListView(
                children: _listWidget(1)
              ),
              ListView(
                children: _listWidget(2)
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _listWidget(int tabIndex) {
    List<Widget> tmp = List();
    for(int i = 0; i < 100; i++) {
      Widget w = ListTile(title: Text("这是第" + tabIndex.toString() + "组第" + i.toString() + "行"));

      tmp.add(w);
    }

    return tmp;
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

