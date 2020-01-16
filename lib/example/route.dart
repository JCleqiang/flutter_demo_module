import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/pages/view_demo/demo_00.dart';
import 'package:flutter_demo_module/example/pages/view_demo/demo_01.dart';
import 'package:flutter_demo_module/example/pages/view_demo/demo_02.dart';
import 'package:flutter_demo_module/example/pages/view_demo/demo_03.dart';
import 'package:flutter_demo_module/example/pages/view_demo/demo_04.dart';
import 'package:flutter_demo_module/example/pages/view_demo/demo_05.dart';
import 'package:flutter_demo_module/example/root_tabs.dart';

final routes = {
  "/": (context) => RootTabs(),
  "/demo_00": (context) => Demo_00(),
  "/demo_01": (context) => Demo_01(),
  "/demo_02": (context) => Demo_02(),
  "/demo_03": (context) => Demo_03(),
  "/demo_04": (context) => Demo_04(),
  "/demo_05": (context) => Demo_05(),
};

//固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 1.1 获取路由名称
  final String name = settings.name;
  // 1.2 根据路由名称获取页面widget
  final Function pageContentBuilder = routes[name];

  //
  if (pageContentBuilder != null) {
    // 1.3 获取入参
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context, arguments: settings.arguments));
      return route;

    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};


