import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/main_tabs.dart';
import 'package:flutter_demo_module/example/root_tabs.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RootTabs(),
    );
  }
}