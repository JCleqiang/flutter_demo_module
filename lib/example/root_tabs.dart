import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/home.dart';

class RootTabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootTabsState();
  }
}

class _RootTabsState extends State<RootTabs>
    with SingleTickerProviderStateMixin {
  TabController controller;
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
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: _pageInfoList.map((value) {
          return value.page;
        }).toList(),
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
      'page': Home("首页")
    },
    {
      'tabTitle': '消息',
      'tabIcon': new Icon(Icons.message),
      'navTitle': '消息',
      'page': Home("消息")
    },
    {
      'tabTitle': '我的',
      'tabIcon': new Icon(Icons.person),
      'navTitle': '我的',
      'page': Home("我的")
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
