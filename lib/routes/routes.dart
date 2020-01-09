import 'package:flutter/material.dart';
import 'package:flutter_demo_module/component/Tabs.dart';
import 'package:flutter_demo_module/component/tab_page.dart';
import 'package:flutter_demo_module/main_12_02/ButtonExample.dart';
import 'package:flutter_demo_module/main_12_02/FormDemo.dart';
import 'package:flutter_demo_module/main_12_01/Home1.dart';
import 'package:flutter_demo_module/main_12_02/Home2.dart';
import 'package:flutter_demo_module/main_12_02/Home3.dart';
import 'package:flutter_demo_module/main_12_02/ListPraise.dart';
import 'package:flutter_demo_module/main_12_02/Search.dart';
import 'package:flutter_demo_module/main_12_02/TextField.dart';
import 'package:flutter_demo_module/pages/banner/pagination.dart';

final routes = {
  "/": (context) => HomePage(),
  "/home1": (context) => Home1(),
  "/home2": (context) => Home2(),
  "/home2": (context) => Home3(),
  "/search": (context, {arguments}) => Search(orderInfo: arguments),
  "/button": (context) => ButtonDemoPage(),
  "/textField": (context) => TextFieldDemoPage(),
  "/formDemo": (context) => FormDemoPage(),
  "/list_praise": (context) => ListPraise(),
  "/banner_page": (context) => Pagination(),
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


