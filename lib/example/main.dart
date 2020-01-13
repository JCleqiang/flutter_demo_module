import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/discard/main_tabs.dart';
import 'package:flutter_demo_module/example/root_tabs.dart';
import 'package:flutter_demo_module/example/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: onGenerateRoute,
    );
  }
}