import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/pages/provider/Counter.dart';
import 'package:flutter_demo_module/example/pages/provider/provider_page.dart';
import 'package:provider/provider.dart';

main() {
  // ChangeNotifierProvider()和ChangeNotifierProvider.value()，
  // 区别在于ChangeNotifierProvider()会在销毁时自动调用ChangeNotifier中的dispose()方法释放一些资源。
  runApp(ChangeNotifierProvider.value(
    value: Counter(1),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider",
      home: ProviderPage(),
    );
  }
}
