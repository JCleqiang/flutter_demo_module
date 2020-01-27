
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_demo_module/example/pages/provider_03/index_provider.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 监听状态的改变
    return Consumer(
        child: PageView(
          physics: NeverScrollableScrollPhysics(), //禁止滚动
          //获取pageController后不监听改变
          controller: Provider.of<IndexProvider>(context, listen: false).pageController,
          children: <Widget>[ChildPage("第一页"), ChildPage("第二页"), ChildPage("第三页")],
        ),
        builder: (BuildContext context, IndexProvider value, Widget child) {
            return Scaffold(
              body: child,
              bottomNavigationBar: BottomNavigationBar(
                  onTap: (index) {
                    value.index = index;
                  },
                  currentIndex: value.index,
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.android), title: Text("android")),
                    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("home")),
                    BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("person")),
                  ]),
              floatingActionButton: FloatingActionButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
              }),
            );
        }
    );
  }

}


class ChildPage extends StatefulWidget {
  final String title;

  ChildPage(this.title);

  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    print("${widget.title}: initState");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("${widget.title}: build");
    return Scaffold(
      backgroundColor: widget.title == '第一页'
          ? Colors.red.withOpacity(0.5)
          : widget.title == '第二页'
          ? Colors.yellow.withOpacity(0.5)
          : Colors.green.withOpacity(0.5),
      appBar: AppBar(title: Text(widget.title)),
      body: Center(child: Text(widget.title)),
    );
  }
}


class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(onPressed: () => changePageIndex(context, 0), child: Text("切换1"), color: Colors.red),
            FlatButton(onPressed: () => changePageIndex(context, 1), child: Text("切换2"), color: Colors.yellow),
            FlatButton(onPressed: () => changePageIndex(context, 2), child: Text("切换3"), color: Colors.green),
          ],
        ),
      ),
    );
  }

  changePageIndex(context, int index) {
    Provider.of<IndexProvider>(context, listen: false).index = index;
  }
}
