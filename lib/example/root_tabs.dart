import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/home.dart';

class RootTabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootTabsState();
  }
}

class _RootTabsState extends State<RootTabs> with SingleTickerProviderStateMixin {
  TabController controller;

//  static List _tabData = [
//    {'text': '首页', 'icon': new Icon(Icons.home)},
//    {'text': '消息', 'icon': new Icon(Icons.message)},
//    {'text': '我的', 'icon': new Icon(Icons.person)}
//  ];
//  List _pages = [
//    Home(Colors.green, "首页"),
//    Home(Colors.deepOrangeAccent, "消息"),
//    Home(Colors.purpleAccent, "我的"),
//  ];
  List<PageInfo> _pageInfoList = PageInfo.getPageInfoList();

  @override
  void initState() {
    super.initState();

    // 初始化TabController和Tab
    controller = TabController(
      length: _pageInfoList.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  // tab上的页面组件数组
  List<Widget> _getPageData() {
    var tempList = _pageInfoList.map((value) {
      return value.page;
    });

    return tempList.toList();
  }

  // 标签item组件数组
  List<BottomNavigationBarItem> _getTabData() {
    var tempList = _pageInfoList.map((value) {
      return BottomNavigationBarItem(
          icon: value.tabIcon, title: Text(value.tabTitle));
    });

    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: _getPageData(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.index,
        onTap: (int index) {
          setState(() {
            controller.index = index;
          });
        },
        items: _getTabData(),
      ),
    );
  }
}

// 数据
class PageInfo {
  String tabTitle;
  Icon tabIcon;
  String navTitle;
  Widget page;

  static List _tabData = [
    {
      'tabTitle': '首页',
      'tabIcon': new Icon(Icons.home),
      'navTitle': '首页',
      'page': Home(Colors.green, "首页")
    },
    {
      'tabTitle': '消息',
      'tabIcon': new Icon(Icons.message),
      'navTitle': '消息',
      'page': Home(Colors.green, "消息")
    },
    {
      'tabTitle': '我的',
      'tabIcon': new Icon(Icons.person),
      'navTitle': '我的',
      'page': Home(Colors.green, "我的")
    },
  ];

  static List<PageInfo> getPageInfoList() {
    List<PageInfo> tmp = List();

    for (int i = 0; i < _tabData.length; i++) {
      PageInfo info = PageInfo();
      info.tabTitle = _tabData[i]["tabTitle"];
      info.tabIcon = _tabData[i]["tabIcon"];
      info.navTitle = _tabData[i]["navTitle"];
      info.page = _tabData[i]["page"];

      tmp.add(info);
    }

    return tmp;
  }
}
