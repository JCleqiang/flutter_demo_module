import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController controller;

  static List tabData = [
    {'text': '动态', 'icon': new Icon(Icons.language)},
    {'text': '组件', 'icon': new Icon(Icons.extension)},
    {'text': '我的', 'icon': new Icon(Icons.import_contacts)}
  ];
  String appBarTitle = tabData[0]['text'];

  List<Widget> myTabs = [];

  @override
  void initState() {
    super.initState();

    // 初始化TabController和Tab
    controller = new TabController(initialIndex: 0, vsync: this, length: 3);
    for(int i = 0; i < tabData.length; i++) {
      var tab = new Tab(text: tabData[i]["text"], icon: tabData[i]["icon"]);
      myTabs.add(tab);
    }
    
    controller.addListener((){
      if(controller.indexIsChanging) {
        _onTabChange();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(appBarTitle),
      ),
      body: new TabBarView(
        controller: controller,
//        children: <Widget> [
//          new ListDemo(),
//        ]
      ),
      bottomNavigationBar: Material(
        color: const Color(0xFFF0EEEF), //底部导航栏主题颜色
        child: SafeArea(
            child: Container(
              height: 65.0,
              child: TabBar(
                  controller: controller,
                  tabs: myTabs,
                  labelColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
              ),
            ),
        ),
      ),
    );
  }

  void _onTabChange() {
    if(!this.mounted) {
      return;
    }

    this.setState((){
      appBarTitle = tabData[controller.index]['text'];
    });
  }
}