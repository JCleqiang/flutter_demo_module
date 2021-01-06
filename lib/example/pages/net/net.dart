import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_module/example/pages/net/http_native.dart';

class Net extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NetState();
  }
}

class NetState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试用例"),
      ),
      body: Container(
        child: RaisedButton(
          child: Text("网络测试"),
          onPressed: () {
            _test01_net();
          },
        ),
      ),
    );
  }

  /// 普通get请求
  void _test01_net() async {
    Response response = await Dio().get(
      "https://www.wanandroid.com/banner/json",
    );

    print(response);
  }

  /// 网络请求
  void _test02_net() async {
    // 配置dio实例
//    dio.options.baseUrl = "https://www.wanandroid.com";
//    dio.options.connectTimeout = 5000; //5s
//    dio.options.receiveTimeout = 3000;
    BaseOptions options = BaseOptions(
      baseUrl: "https://www.wanandroid.com",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );

    Dio dio = Dio(options); // 使用默认配置
  }

  /// 普通get请求
  void _test03_net() async {
    //
    HttpNative native = HttpNative();
    Response response2 =
        await native.get("https://www.wanandroid.com/banner/json");
    print(response2);
  }
}
