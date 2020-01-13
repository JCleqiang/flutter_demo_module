import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/home.dart';

class MainTabs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainTabsPage();
  }
}

class MainTabsPage extends State<MainTabs> {
  int _currentIndex = 0;
  List _pages = [
    Home("首页"),
    Home("消息"),
    Home("我的"),
  ];

  void _updateIndex(int index) {
    setState(() {
      if (_currentIndex != index) {
        _currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
            setState(() {
              _updateIndex(index);
            });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
          BottomNavigationBarItem(icon: Icon(Icons.message), title: Text("消息")),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的"))
        ],
      ),
    );
  }
}
